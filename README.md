# Rubytify
----------

## QA

1. Why did I use interactors?

R: Logic must be wrapped outside controllers (Always), in  case you need to pass common behaviors through entities, so, Concerns can be used. But, what if when you need to register a bunch of code to certain actions? This gem extracts part of the Trailblazer's architecture where actions are considered as operations, and where you can register several steps inside each one.

Interactor brings out more features than Ruby POROS and Service Objects, it offers the unique opportunity to enclosure errors and results on critical operations by keeping simple data across sharing.

Interactors itself is also a design pattern called Command, it's really useful when you are creating any DSL architecture.

2. Why did I to decide to persist data instead of fetching information based in users requests?

R: Instead of wasting a huge operational performance in saving Artists, Albums and Songs, I could have saved only preloaded list of Artists, and then, fetch their albums and songs by users request, but, I decided to persist all information due to caching performances, so, I can pre-load existing collections without performing unnecessary requests.

3. Why did I create a seed file instead of following the guide to create a Rake's task?

4. Why I used a gem instead of creating a HTTP client from scracht?

5. Why I used AMS instead of any other serializer?

6. Why I decided to create a layer to parse responses by using ActiveSupport methods?

7. Why didn't I create an api only by using Rails's CLI?
