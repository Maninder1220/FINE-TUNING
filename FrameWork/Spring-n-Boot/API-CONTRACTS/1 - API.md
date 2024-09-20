# API | API Contracts | JSON
The software industry has adopted several patterns for capturing agreed 
upon API behavior in documentation and code. These agreements are often called "contracts".

Two examples include :  
- Consumer Driven Contracts and 
- Provider Driven Contracts.

This contract defines how API providers and consumers interact, what data exchanges looks like, and how to communicate success and failure cases.

The provider and consumers do not have to share the same programming language, 
only the same API contracts.

# EG
Request
  URI: /cashcards/{id}
  HTTP Verb: GET
  Body: None

Response:
  HTTP Status:
    200 OK if the user is authorized and the Cash Card was successfully retrieved
    401 UNAUTHORIZED if the user is unauthenticated or unauthorized
    404 NOT FOUND if the user is authenticated and authorized but the Cash Card cannot be found
  Response Body Type: JSON
  Example Response Body:
    {
      "id": 99,
      "amount": 123.45
    }

# We'll provide resources for these patterns, but won't discuss them in detail in this course.

# Why Are API Contracts Important!?
- API contracts are important because they communicate the behavior of a REST API.
- They provide specific details about the data being serialized (or deserialized) for each command and 
  parameter being exchanged.
- The API contracts are written in such a way that can be easily translated into API provider and consumer 
  functionality, and corresponding automated tests.

  # What is JSON
  JSON (Javascript Object Notation) provides a data interchange format that represents the particular information of an object in a format that you can easily read and understand.

  JSON will be used as our data interchange format for the Family Cash Card API.