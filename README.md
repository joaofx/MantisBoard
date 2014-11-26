First create a filter named 'Current Sprint' to view just current sprint stories

Then call get.rb to get stories and tasks

```
ruby get.rb MantisUserName MantisUserPassword MantisProjectName MantisUrl
```

A file named stories.yaml will be created

Then call web.rb to serve the task board

```
ruby web.rb
```

Open a browser and load http://localhost:4567/
