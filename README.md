Collector
=========

Rails test app

Run tests: 

```
bundle install
rake db:setup
rake db:test:prepare
cucumber
```

Results:

```
4 scenarios (4 passed)
30 steps (30 passed)
```

Run parser: `rake wsdl_parser:load_data`

