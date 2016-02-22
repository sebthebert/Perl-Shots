# Perl OneLiners

## WebServers

### num2fr

A one liner "Number to French Literal WebServer":
```
plackup -MLingua::FR::Numbers \ 
  -e 'sub { my $e = shift; my $nb = $e->{QUERY_STRING}; \ 
  return [ "200", [], [ Lingua::FR::Numbers::number_to_fr($nb) . "\n" ]] }' &
```

And then:
```
curl http://127.0.0.1:5000?123456789
cent vingt-trois millions quatre cent cinquante-six mille sept cent quatre-vingt-neuf
```
