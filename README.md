## run application

create 'config/database.yml'

```bash
bundle install

rake db:create db:migrate db:seed

rails s
```

[Admin panel link](http://localhost:3000/admin)


Editor account:

email: editor@example.com

password: 1234567890

## run test

```bash
rspec
```
