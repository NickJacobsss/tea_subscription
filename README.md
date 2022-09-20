# Tea Subscriptions!

## About This Project
**Tea Subscriptions** is a REST API that allows the customers to create/cancel/view their current and past Tea Subscriptions, built to be used by a theroretical Front End Application. 
This project was created in just a few short hours to showcase an example of a take home project from a prospective employer.
 
<b>Tea Subscriptions</b> utilizes **Ruby on Rails** with **PostgreSQL** database to store its relational data.

  <br>
  
  - **Endpoints**
    - Retrieves all current and past subscriptions:
      ```
       GET /api/v1/customers/(customer_id)/subscriptions
      ```
    - Create new subscription
      ```
       POST /api/v1/customers/(customer_id)/subscriptions
       example_params =
        {
          "title": "Black Tea, Montly",
          "price": 15,
          "frequency": "montly",
          "tea_id": 7
        }
      ```
    - Cancel an active subscription
      ```
      PATCH /api/v1/customers/(customer_id)/subscriptions/(subscription_id)
       example_param = 
      {
        "status": "cancelled",
      }
      ```

<p align="right">(<a href="#top">back to top</a>)</p>


## Prerequisites

Bone was developed in Rails 5.2.8.1 (it is recommended to use either this version or a newer version of rails within Rails 5) and Ruby version 2.7.4.

To verify your version of Ruby and Rails run the following commands from your command line:

```
$ ruby -v
=> ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [arm64-darwin21]

$ rails -v
=> rails 5.2.8.1
```
If you do not have Ruby installed please visit the Ruby docs [here](https://www.ruby-lang.org/en/documentation/installation/).

If you also need Rails please visit the Rails documentation site [here](https://guides.rubyonrails.org/v5.0/getting_started.html).


## Installation

1. Clone this directory to your local repository using the SSH key:
```
$ git@github.com:NickJacobsss/tea_subscription.git
```

2. Install gems for development using [Bundler](https://bundler.io/guides/using_bundler_in_applications.html#getting-started---installing-bundler-and-bundle-init):
```
$ bundle install
```

3. Set up your database with:
```
$ rails db:{drop,create,migrate,seed}
```

4. Run the test suite with:
```
$ bundle exec rspec
```

5. Run your development server with:
```
$ rails s
```

6. In your browser, visit ['localhost:3000/`](http://localhost:3000/) to see the app in action.


<p align="right">(<a href="#top">back to top</a>)</p>


## Tech Stack

### Framework
<p>
  <img src="https://img.shields.io/badge/ruby%20on%20rails-b81818.svg?&style=for-the-badge&logo=rubyonrails&logoColor=white" />
</p>

### Languages
<p>
  <img src="https://img.shields.io/badge/ruby-CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white" />
</p>


### Tools
<p>
  <img src="https://img.shields.io/badge/git-F05032.svg?&style=for-the-badge&logo=git&logoColor=white" />
   <img alt="GitHub" src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/>
   <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=for-the-badge&logo=atom&logoColor=white" /><br />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/postico-4169E1.svg?&style=for-the-badge&logo=Postico&logoColor=white" />
</p>

### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-E9573F.svg?&style=for-the-badge&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-E9573F.svg?&style=for-the-badge&logo=rubygems&logoColor=white" /><br />
  <img src="https://img.shields.io/badge/shoulda--matchers-E9573F.svg?&style=for-the-badge&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/simplecov-E9573F.svg?&style=for-the-badge&logo=rubygems&logoColor=white" />  
</p>

### Processes
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=for-the-badge&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=for-the-badge&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=for-the-badge&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=for-the-badge&logo=REST&logoColor=white" />  
</p>

<p align="right">(<a href="#top">back to top</a>)</p>
