# Rubytify

Rubytify uses Spotify's API to retrieve information of selected artists which are loaded from a .YAML file, it also persists this information into a database to expose it over a Restful API.

## Approach
-----------

 At the beginning, I realized that this exercise consisted in a deep nested records assignments, while I was working on the implementation many issues showed up such as N+1 issue for Insert statements.

I thought in implementing separated retrieving data queries by saving artists information only, and then, get all their albums and songs as these resources were requested (Lazy loading implementation), but clearly this didn't match with the initial requirement.

I tried to implement deep_simbolyze_keys methods from ActiveSupport to convert string keys into symbol ones (For performance issues), but, this operation implies a huge memory wasting in the execution process and since models only have fews attributes where this method will worth on.

So, I decided to create my own getters methods to break down my models into ActiveRecord resources by selecting only attributes that I needed.

In this implementation I used several design patterns and refactoring strategies, even non-convencional patterns such as metaprogramming, as you can see it uses Interactors that is a concept that Trailblazer introduced to cut down logic lines into the controllers, ensuring critical operations working, and easing errors handleing.

## QA
-----

### 1. Why did I use interactors?

R: Logic must be wrapped outside controllers (Always), in  case you need to pass common behaviors through entities, so, Concerns can be used. But, what if when you need to register a bunch of code to certain actions? This gem extracts part of the Trailblazer's architecture where actions are considered as operations, and where you can register several steps inside each one.

Interactor brings out more features than Ruby POROS and Service Objects, it offers the unique opportunity to enclosure errors and results on critical operations by keeping simple data across sharing.

Interactors itself is also a design pattern called Command, it's really useful when you are creating any DSL architecture.

### 2. Why did I to decide to persist data instead of fetching information based in users requests?

R: Instead of wasting a huge operational performance in saving Artists, Albums and Songs, I could have saved only preloaded list of Artists, and then, fetch their albums and songs by users request, but, I decided to persist all information due to caching performances, so, I can pre-load existing collections without performing unnecessary requests.

### 3. Why I used a gem instead of creating a HTTP client from scracht?

R: From my point of view, RSpotify provides a whole and well-documented gem to connect to Spotify's API, so, that's why I decided to skip any option of creating a custom implementation.

### 4. Why didn't I create an api only by using Rails's CLI?

R: I wanted to show you how we can reduce the amount of code that is really usefull in a regular Rails application, even passing the flag --api-only it will create a bunch of unnecessary code.