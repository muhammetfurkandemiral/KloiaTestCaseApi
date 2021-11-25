Feature: Test Automation Case Study-2 (API)

  Background:
    * def baseURI = 'https://petstore.swagger.io/v2'
    * def helper = Java.type('tests.helpers.Helper')

  @task1 @wip
  Scenario Outline: Task1
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=<status>'
    When method GET
    Then status 200
    And match header content-type contains 'application/json'
    And match $..id each contains '#present'
    And match $..id each contains '#notnull'
    And match $..status contains '<status>'
    * print response
    Examples:
      | status    |
      | available |
      | pending   |

  @task2 @wip
  Scenario: Task2
    * print 'email:' , helper.email()

  @task3 @wip
  Scenario: Task3
    And def user = read('classpath:tests/data/user.json')
    Given url baseURI
    And header Content-Type = 'application/json'
    And path 'user'
    And def id = helper.id()
    And set user.id = id
    And set user.username = helper.userName()
    And set user.firstName = helper.firstName()
    And set user.lastName = helper.lastName()
    And set user.email = helper.email()
    And set user.password = helper.password()
    And set user.phone = helper.phone()
    And set user.userStatus = helper.userStatus()
    And request user
    When method POST
    Then status 200
    And match response.message == id
    And print 'after post', response

  @task4 @wip
  Scenario: Task4
    And def user = read('classpath:tests/data/user.json')
    Given url baseURI
    And header Content-Type = 'application/json'
    And path 'user'
    And def id = helper.id()
    And set user.id = id
    And set user.username = '#(username)'
    And set user.firstName = helper.firstName()
    And set user.lastName = '#(lastname)'
    And set user.email = helper.email()
    And set user.password = helper.password()
    And set user.phone = helper.phone()
    And set user.userStatus = helper.userStatus()
    And request user
    When method POST
    Then status 200
    And match response.message == id
    And print 'after post', response


  @wip
  Scenario: Call Task 4
    * def demo = call read('Kloia.feature@task4') {username : 'MFD',lastname : 'DEMIRAL'}




