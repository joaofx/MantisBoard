# MantisBoard

Tool that creates a Kanban board view for Mantis.

Warning: It was developed for my past job that had a customized version of Mantis. You might can adapt the get.rb file to import tickets from your Mantis

### Setup

After clone, run:

```
bundle install
```

### Load Fake Stories

Run:

```
ruby fake_stories.rb
```

### Run

```
ruby web.rb
```

Open the browser at http://localhost:4567/

### Import Stories From Mantis

First create a filter named 'Current Sprint' to view just current sprint stories

Then call get.rb to get stories and tasks

```
ruby get.rb MantisUserName MantisUserPassword MantisProjectName MantisUrl
```

A file named stories.yaml will be created