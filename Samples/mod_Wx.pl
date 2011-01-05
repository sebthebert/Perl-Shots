#!/usr/bin/perl

=head1 NAME

mod_Wx.pl - Demo for Wx module 

=head1 DESCRIPTION

More info on CPAN -> http://search.cpan.org/perldoc?Wx

=cut

use strict;
use warnings;

use Wx qw(wxOK wxICON_INFORMATION wxOPEN wxMULTIPLE);
use Wx::Event qw(EVT_MENU EVT_BUTTON);

my $app   = Wx::SimpleApp->new;
my $frame = Wx::Frame->new(
    undef,               # Object without parent
    -1,                  # Dynamic ID
    'Wx Module Demo',    # Window Title
    [20,  20],           # Position sur le bureau
    [600, 200]           # Width & Height
);

$frame->SetIcon(Wx::GetWxPerlIcon());

# StatusBar with 2 zones
$frame->CreateStatusBar(2);
$frame->SetStatusText("Wx Demo status 1", 0);
$frame->SetStatusText("Wx Demo status 2", 1);

Create_Menu(
    $frame,
    {
        title => 'File',
        items => [
            {
                id       => 10002,
                label    => 'Open',
                shortcut => 'Ctrl-o',
                desc     => 'Open File',
                fct      => \&OnOpen
            },
            {
                id       => 10004,
                label    => 'Quit',
                shortcut => 'Ctrl-q',
                desc     => 'Leave this demo',
                fct      => \&OnQuit
            },
        ]
    },
    {
        title => 'About',
        items => [
            {
                id       => 10003,
                label    => 'About',
                shortcut => 'Ctrl-h',
                desc     => 'About',
                fct      => \&OnAbout
            },
        ]
    }
);

=head1 FUNCTIONS
    
=head2 Create_Menu

Creates a full menu

=cut

sub Create_Menu
{
    my ($frame, @menus) = @_;

    my $menubar = Wx::MenuBar->new();
    $frame->SetMenuBar($menubar);
    foreach my $m (@menus)
    {
        my $menu = Wx::Menu->new();
        $menubar->Append($menu, $m->{title});
        foreach my $i (@{$m->{items}})
        {
            $menu->Append($i->{id}, "$i->{label}\t$i->{shortcut}", $i->{desc});
            EVT_MENU($frame, $i->{id}, $i->{fct});
        }
    }
}

=head2 OnOpen

Called by click on menu 'File>Open'

=cut

sub OnOpen
{
    my ($this, $event) = @_;

    my $default_dir  = '/tmp';
    my $default_file = undef;

    my $dialog = Wx::FileDialog->new(
        $this,            # Parent Widget
        "Open File",      # Dialog Title
        $default_dir,     # Default dir
        $default_file,    # Default file
        "Text files (*.txt)|*.txt|All files (*.*)|*.*",
        wxOPEN | wxMULTIPLE
    );

    $dialog->ShowModal();
}

=head2 OnAbout

Called by click on menu 'File>About'

=cut

sub OnAbout
{
    my ($this, $event) = @_;

    Wx::MessageBox("This is a demo for the Wx module.",
        "Dialog Title", wxOK | wxICON_INFORMATION, $this);
}

=head2 OnQuit

Called by click on menu 'File>Quit'

=cut

sub OnQuit
{
    my ($this, $event) = @_;

    $this->Destroy();
}

$frame->Show;
$app->MainLoop;

=head1 AUTHOR

Sebastien Thebert <sebthebert@gmail.com>

=cut
