# WDI 5 Student Repository

Welcome to the GA London WDI 5 student repository. This is the place we are going to use to store resources for your reference and use to monitor the completion of your classwork assignments and homework.

## How to use

First things first. [Fork](https://help.github.com/articles/fork-a-repo) this repository and clone your fork to your machine.

In the root folder, create a folder with your name, but make it unambiguous. For instance, if there were two students called "Michael" in the class, I would name my folder something like 'michaelp' or 'michael_pavling' to make it clear it was for my work.

Then each day, inside your own assignments folder, create folders for the day of the course named along the lines of "w1d2" (for week one, day two) - the name/number of the day should be written on the board by the instructor each morning for your reference (above the itinerary for the day).

Inside the daily folder, create folders for each assignment you work on, whether they're classroom 'labs' or homework assignments.

So your folder structure should look something like this:

    |- student_repository_root
       |- assignments
          |- _completed_assignments
          |  |- ... examples of completed assignments for your reference
          |           supplied by the instructors the day after the homeworks are completed         
          |
          |- michael_pavling
          |  |- w1d2
          |  |  |- html_lab
          |  |  |  |- ... files here
          |  |  |
          |  |  |- homework
          |  |     |- ... files here
          |  |
          |  |- w1d3
          |     |- calc_it_lab_in_class
          |     |  |- ... files here
          |     |
          |     |- homework
          |        |- ... files here
          |
          |- michael_taylor
             |- ... other students' work - don't edit anything outside of your path!

## Submitting work

At the end of each day (or first thing each morning), ensure all of your previous day's work is committed to git and pushed to your github fork of the student work repository.

DO NOT EDIT OR REMOVE OTHER STUDENTS' DIRECTORIES! (or alter any of the completed examples). If you do, and you commit the changes, they will be included in your pull requests and risk breaking things for everyone else. At best, your PR will be rejected, and you will need to restore your fork to a good working state).

* Note: if you have "scratch" files that you're working on, or experimental classwork you *do not* want to end up submitted to the repository either:
  - delete them!
  - [stash](http://git-scm.com/book/en/Git-Tools-Stashing) them
  - move them outside of the student repository path - have some other folder on your machine you 'experiment' with code in
  - [ignore](http://git-scm.com/docs/gitignore) them in git

* Another note: If you work in a group, and you don't have a copy of the code for that group's work, either:
  - submit a `README.md` file in the assignment's directory with the details of where the code is and what team you were working in
  - for your own posterity, get a copy of the code from the student that does have it and submit it as usual.

Then create a [pull request](https://help.github.com/articles/using-pull-requests) from your fork. This will automatically include all the commits you have made to the repository.

The instructional team will then merge your pull request, and use the main repository as the source to grade your work. If you do not issue a pull request, it will appear to us that you have not completed the assignments for the previous day, and it will be recorded as such.

If you have any problems with submitting assignments, get our assistance soonest.


## Updating your fork (getting updated class notes)

You forked the ga-students repository to your own Github account by following the instructions above, and cloned it to your local machine. Now you need to get updates from the parent fork, so you can get the class notes from each day.

We do this by adding a *remote* to our local repository, and fetching changes from it.

### Initial setup

Add an upstream remote by visiting the ga-students WDI repo on Github, and copying the *SSH clone URL* from the sidebar. Then change into your local repo that you cloned from your fork, and run the following:

```shell
    $ git remote -v
    # Shows current remotes; you will have two named 'origin'
    $ git remote add upstream git@github.com:YourGitHubName/WDI_LDN_5_Classnotes.git # enter your own clone URL
    $ git remote -v
    # You should see your upstream remote added.
```

### Getting updates

You only have to perform the initial setup once; once you've done that, to get the remote changes, run these two commands in your local repo:

```shell
    $ git fetch upstream # To get changes from ga-students
    $ git merge upstream/master # To merge them to your repo
```