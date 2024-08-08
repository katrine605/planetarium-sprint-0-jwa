# Planetarium Test Case Creation

## Table of Contents

1. [Users should be able to open a new User account with the Planetarium](#users-should-be-able-to-open-a-new-User-account-with-the-Planetarium)
2. [Users should be able to securely access their account](#users-should-be-able-to-securely-access-their-account)
3. [Users should be able to see planets and moons added to the Planetarium](#users-should-be-able-to-see-planets-and-moons-added-to-the-planetarium)
4. [Users should be able to add new Planets to the Planetarium](#users-should-be-able-to-add-new-planets-to-the-planetarium)
5. [Users should be able to remove Planets from the Planetarium](#users-should-be-able-to-remove-planets-from-the-planetarium)
6. [Users should be able to add Moons to the Planetarium associated with a Planet](#users-should-be-able-to-add-moons-to-the-planetarium-associated-with-a-planet)
7. [Users should be able to remove Moons from the Planetarium](#users-should-be-able-to-remove-moons-from-the-planetarium)

## Users should be able to open a new User account with the Planetarium

- Name: account creation
- Description: Users should be able to open a new User account with the Planetarium
- System: Planetarium application
- Preconditions:
  - No registered user with username "Planets and Moons are awesome!"
  - No registered user with username “!"#$%&'()\*+,-./:;<=>?@[]^\_`|~\”
  - Registered user with username "Batman"

Actors:
User (creating a new account)
Planetarium application (handles the creation of the new account)

### Use Case Data

- URL = http://localhost:8080/
- valid username = "Planets and Moons are awesome!"
- valid password = "Planetarium is the place to be"
- valid special characters username and password = "!"#$%&'()\*+,-./:;<=>?@[]^\_`|~\"
- non-unique username = "Batman"
- too long username = "Planets and Moons are fantastic"
- too long password = "Planetarium is very interesting"

### Decision Table

| Scenario                                                  | Username                | Password                | Result              |
| --------------------------------------------------------- | ----------------------- | ----------------------- | ------------------- |
| Positive Use Case Scenario: Valid credentails             | valid username          | valid password          | user registered     |
| Positive Use Case Scenario: Special character credentials | special character field | special character field | user registered     |
| Negative Use Case Scenario: Username not unique           | non-unique username     | valid password          | user not registered |
| Negative Use Case Scenario: Username too long             | too long username       | valid password          | user not registered |
| Negative Use Case Scenario: Password too long             | valid username          | too long password       | user not registered |
| Negative Use Case Scenario: Username blank                | blank username          | valid password          | user not registered |
| Negative Use Case Scenario: Password blank                | valid username          | blank password          | user not registered |

### Test Cases

| Id  | Description                                               | Preconditions                                                        | Test Data                                                         | Steps                                                                                                                                                                                                                       | Expected Outcome                                    | Actual Outcome                                                                                                      | Tester | Status |
| --- | --------------------------------------------------------- | -------------------------------------------------------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------ | ------ |
| 1   | Positive Use Case Scenario: Valid Credentials             | No registered user with username "Planets and Moons are awesome!"    | - valid username<br> - valid password                             | 1. get to landing page <br> 2. pick option to create an account <br> 3. provide valid username <br> 4. provide valid password <br> 5. click create button <br>6. user should be registered with the planetarium             | User should be informed their account was created   | User is informed with an alert that the account was created with the valid username and valid password              | Kat    | Passed |
| 2   | Positive Use Case Scenario: Special character credentials | No registered user with username "!"#$%&'()\*+,-./:;<=>?@[\]^\_`\|~" | - special character username<br> - special character password<br> | 1. get to landing page <br> 2. pick option to create an account <br> 3. provide special character username <br> 4. provide valid password <br> 5. click create button <br>6. user should be registered with the planetarium | User should be informed their account was created   | User is informed with an alert that the account was created with the special character username and valid password  | Kat    | Passed |
| 3   | Negative Use Case Scenario: Username not unique           | Registered user with username "Batman"                               | - non-unique username<br> - valid password                        | 1. get to landing page <br> 2. pick option to create an account <br> 3. provide non-unique username <br> 4. provide valid password <br> 5. click create button <br>6. user should not be registered with the planetarium    | User should be informed the account creation failed | User is informed with an alert that the account creation failed with the non-unique username and the valid password | Kat    | Passed |
| 4   | Negative Use Case Scenario: Username too long             | N/A                                                                  | - too long username<br> - valid password                          | 1. get to landing page <br> 2. pick option to create an account <br> 3. provide too long username <br> 4. provide valid password <br> 5. click create button <br>6. user should not be registered with the planetarium      | User should be informed the account creation failed | User is informed with an alert that the account creation failed with the too long username and the valid password   | Kat    | Passed |
| 5   | Negative Use Case Scenario: Password too long             | No registered user with username "Planets and Moons are awesome!"    | - valid username<br> - too long password                          | 1. get to landing page <br> 2. pick option to create an account <br> 3. provide valid username <br> 4. provide too long password <br> 5. click create button <br>6. user should not be registered with the planetarium      | User should be informed the account creation failed | User is informed with an alert that the account creation failed with the valid username and the too long password   | Kat    | Passed |
| 6   | Negative Use Case Scenario: Username blank                | N/A                                                                  | - blank username<br> - valid password                             | 1. get to landing page <br> 2. pick option to create an account <br> 3. leave username blank <br> 4. provide valid password <br> 5. click create button <br>6. user should not be registered with the planetarium           | User should be informed the account creation failed | User is informed with an alert that the account creation failed with the blank username and the valid password      | Kat    | Passed |
| 7   | Negative Use Case Scenario: Password blank                | No registered user with username "Planets and Moons are awesome!"    | - valid username<br> - blank password                             | 1. get to landing page <br> 2. pick option to create an account <br> 3. provide valid username <br> 4. leave password blank<br> 5. click create button <br>6. user should not be registered with the planetarium            | User should be informed the account creation failed | User is informed with an alert that the account creation failed with the valid username and blank password          | Kat    | Passed |

## Users should be able to securely access their account

- Name: account creation
- Description: Users should be able to securely access their account with the Planetarium
- System: Planetarium application
- Preconditions:
  - Registered user with username "Planets and Moons are awesome!"
  - No registered user with username "Planets and Moons are fantastic"
- Actors:
  - User (logging in into existing account)
  - Planetarium application

### Use Case Data

- URL = http://localhost:8080/
- valid username = "Planets and Moons are awesome!"
- valid password = "Planetarium is the place to be"
- invalid username = "Planets and Moons are fantastic"
- invalid password = "Planetarium is very interesting"

### Decision Table

| Scenario                                      | Username         | Password         | Result             |
| --------------------------------------------- | ---------------- | ---------------- | ------------------ |
| Positive Use Case Scenario: Valid credentails | valid username   | valid password   | user logged in     |
| Negative Use Case Scenario: Username invalid  | invalid username | valid password   | user not logged in |
| Negative Use Case Scenario: Password invalid  | valid username   | invalid password | user not logged in |
| Negative Use Case Scenario: Username blank    | blank username   | valid password   | user not logged in |
| Negative Use Case Scenario: Password blank    | valid username   | blank password   | user not logged in |

### Test Cases

| Id  | Description                                   | Preconditions                                                      | Test Data                               | Steps                                                                                                                                                           | Expected Outcome                                 | Actual Outcome                                                                                                | Tester | Status |
| --- | --------------------------------------------- | ------------------------------------------------------------------ | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | ------ | ------ |
| 1   | Positive Use Case Scenario: Valid Credentials | Registered user with username "Planets and Moons are awesome!"     | - valid username<br> - valid password   | 1. get to landing page <br>2. provide valid username <br> 3. provide valid password <br>4. click login button<br>5. user should be logged in to the Planetarium | User should be informed they were logged in      | User is redirected to the homepage, with a headline "Welcome to the Home Page Planets and Moons are awesome!" | Kat    | Passed |
| 2   | Negative Use Case Scenario: Username invalid  | No registered user with username "Planets and Moons are fantastic" | - invalid username<br> - valid password | 1. get to landing page <br>2. provide valid username <br> 3. provide valid password <br>4. click login button<br>5. user should be logged in to the Planetarium | User should be informed the account login failed | User is informed with an alert that the login attempt failed and to try again                                 | Kat    | Passed |
| 3   | Negative Use Case Scenario: Password invalid  | Registered user with username "Planets and Moons are awesome!"     | - valid username<br> - invalid password | 1. get to landing page <br>2. provide valid username <br> 3. provide valid password <br>4. click login button<br>5. user should be logged in to the Planetarium | User should be informed the account login failed | User is informed with an alert that the login attempt failed and to try again                                 | Kat    | Passed |
| 4   | Negative Use Case Scenario: Username blank    | N/A                                                                | - blank username<br> - valid password   | 1. get to landing page <br>2. provide valid username <br> 3. provide valid password <br>4. click login button<br>5. user should be logged in to the Planetarium | User should be informed the account login failed | User is informed with an alert that the login attempt failed and to try again                                 | Kat    | Passed |
| 5   | Negative Use Case Scenario: Password blank    | Registered user with username "Planets and Moons are awesome!"     | - valid username<br> - blank password   | 1. get to landing page <br>2. provide valid username <br> 3. provide valid password <br>4. click login button<br>5. user should be logged in to the Planetarium | User should be informed the account login failed | User is informed with an alert that the login attempt failed and to try again                                 | Kat    | Passed |

## Users should be able to see planets and moons added to the Planetarium

- Name: planet & moon visibility
- Description: Users should be able to see planets and moons added to the Planetarium
- System: Planetarium application
- Preconditions:
  - Logged in user with username "Planets and Moons are awesome!"
  - Registered user with username "Batman"
  - Added planet with name "Jupiter" with username "Planets and Moons are awesome!" as owner
  - Added moon with name "Callisto" with planet name "Jupiter" as owner
  - Added planet with name "Earth" with username "Batman" as owner
  - Added moon with name "Luna" with planet name "Earth" as owner
- Actors:
  - User (logged into existing account)
  - Planetarium application

### Use Case Data

- Homepage URL = http://localhost:8080/planetarium

### Decision Table

| Scenario                                                       | Added Planet                                 | Added Moon                                          | Result         |
| -------------------------------------------------------------- | -------------------------------------------- | --------------------------------------------------- | -------------- |
| Positive Use Case Scenario: User's added planet is visible     | planet name with logged in user as owner     | N/A                                                 | planet visible |
| Positive Use Case Scenario: User's added moon                  | planet name with logged in user as owner     | moon name with logged in user's planet as owner     | moon visible   |
| Positive Use Case Scenario: Other user's added planet          | planet name with logged in user not as owner | N/A                                                 | planet visible |
| Positive Use Case Scenario: Other user's added planet and moon | planet name with logged in user not as owner | moon name with logged in user's planet not as owner | moon visible   |

### Test Cases

| Id  | Description                                           | Preconditions                                                                                                                        | Test Data                                           | Steps                                                                                            | Expected Outcome                                                | Actual Outcome                       | Tester | Status |
| --- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------- | ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------- | ------------------------------------ | ------ | ------ |
| 1   | Positive Use Case Scenario: User's added planet       | Logged in user with username "Batman"<br>Added planet with name "Earth"                                                              | - valid added planet name                           | 1. get to homepage <br> 2. added planet should be visible in the Planetarium                     | User should be able to see the added planet                     | Planet is visible in the planetarium | Kat    | Passed |
| 2   | Positive Use Case Scenario: User's added moon         | Logged in user with username "Batman"<br>Added planet with name "Earth"<br>Added moon with name "Luna"                               | - valid added planet name and valid added moon name | 1. get to homepage <br> 2. added moon and referenced planet should be visible in the Planetarium | User should be able to see the added moon and referenced planet | Moon is visible in the planetarium   | Kat    | Passed |
| 3   | Positive Use Case Scenario: Other user's added planet | Logged in user with username "Planets and Moons are awesome!"<br>Added planet with name "Jupiter"                                    | - valid added planet name                           | 1. get to homepage <br> 2. added planet should be visible in the Planetarium                     | User should be able to see the added planet                     | Planet is visible in the planetarium | Kat    | Passed |
| 4   | Positive Use Case Scenario: Other user's added moon   | Logged in user with username "Planets and Moons are awesome!"<br>Added planet with name "Jupiter"<br>Added moon with name "Callisto" | - valid added planet name and valid added moon name | 1. get to homepage <br> 2. added moon and referenced planet should be visible in the Planetarium | User should be able to see the added moon and referenced planet | Moon is visible in the planetarium   | Kat    | Passed |

## Users should be able to add new Planets to the Planetarium

- Name: planet addition
- Description: Users should be able to add new Planets to the Planetarium
- System: Planetarium application
- Preconditions:
  - Logged in user with username "Batman!" and owner id “1”
  - Existing planet with name “Earth”
  - Existing moon with name “Luna”
  - No existing planet with name “This is a newly made up planet”
  - No existing planet with name “!"#$%&'()\*+,-./:;<=>?@[]^\_`|~\”
- Actors:
  - User (logged into existing account)
  - Planetarium application

### Use Case Data

- Homepage URL = http://localhost:8080/planetarium
- valid planet name = "This is a newly made up planet"
- too long planet name = "This planet wont want to exist!"
- special characters planet name = "!"#$%&'()\*+,-./:;<=>?@[]^\_`|~\"
- non-unique planet name = "Earth"
- non-unique moon name = "Luna"
- valid image = "planet-5.jpg"

### Decision Table

| Scenario                                                         | Planet Name                    | Image       | Result           |
| ---------------------------------------------------------------- | ------------------------------ | ----------- | ---------------- |
| Positive Use Case Scenario: Valid planet name with image         | valid planet name              | valid image | planet added     |
| Positive Use Case Scenario: Valid planet without image           | valid planet name              | N/A         | planet added     |
| Positive Use Case Scenario: Special characters planet name       | special characters planet name | valid image | planet added     |
| Negative Use Case Scenario: Non-unique planet name               | non-unique planet name         | valid image | planet not added |
| Negative Use Case Scenario: Non-unique moon name                 | non-unique moon name           | valid image | planet not added |
| Negative Use Case Scenario: Too long planet name                 | too long planet name           | valid image | planet not added |
| Negative Use Case Scenario: Blank planet name                    | blank planet name              | valid image | planet not added |
| Negative Use Case Scenario: Non-unique planet name without image | non-unique planet name         | N/A         | planet not added |
| Negative Use Case Scenario: Non-unique moon name without image   | non-unique moon name           | N/A         | planet not added |
| Negative Use Case Scenario: Too long planet name without image   | too long planet name           | N/A         | planet not added |
| Negative Use Case Scenario: Blank planet name without image      | blank planet name              | N/A         | planet not added |

### Test Cases

| Id  | Description                                                           | Preconditions                                                                                            | Test Data                                           | Steps                                                                                                                                                                                                                       | Expected Outcome                                                                       | Actual Outcome                                                                                   | Tester | Status |
| --- | --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------ | ------ |
| 1   | Positive Use Case Scenario: Valid planet name with image              | Logged in user with username "Batman"<br>No added planet with name "This is a newly made up planet"      | - valid planet name <br> - valid image              | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide valid planet name <br> 4. provide valid image <br> 5. click submit planet<br> 6. planet should be added to the planetarium                            | User should be able to see the added planet                                            | Homepage refreshed, planetarium includes added planet with logged in user id as owner            | Kat    | Passed |
| 2   | Positive Use Case Scenario: Valid planet name without image           | Logged in user with username "Batman"<br>No added planet with name "This is a newly made up planet"      | - valid planet name                                 | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide valid planet name <br> 4. leave image blank <br> 5. click submit planet<br> 6. planet should be added to the planetarium                              | User should be able to see the added planet                                            | Planet is not added to the planetarium, user is not informed of the failure                      | Kat    | Failed |
| 3   | Positive Use Case Scenario: Special characters planet name with image | Logged in user with username "Batman"<br>No added planet with name "!"#$%&'()\*+,-./:;<=>?@[\]^\_` \| ~" | - special characters planet name <br> - valid image | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide special characters planet name <br> 4. provide valid image <br> 5. click submit planet<br> 6. planet should be added to the planetarium               | User should be able to see the added planet                                            | Homepage refreshed, planetarium includes added planet with logged in user id as owner            | Kat    | Passed |
| 4   | Negative Use Case Scenario: Non-unique planet name with image         | Logged in user with username "Batman"<br>Added planet with name "Earth"                                  | - non-unique planet name <br> - valid image         | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide non-unique planet name <br> 4. provide valid image <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium | User should not be able to see the added planet                                        | Planet is not added, user is informed with an alert that something went wrong, please try again. | Kat    | Passed |
| 5   | Negative Use Case Scenario: Non-unique moon name with image           | Logged in user with username "Batman"<br>Added moon with name "Luna"                                     | - non-unique moon name <br> - valid image           | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide non-unique moon name <br> 4. provide valid image <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium   | User should not be able to see the added planet                                        | Homepage refreshed, planetarium includes added planet with logged in user id as owner            | Kat    | Failed |
| 6   | Negative Use Case Scenario: Too long planet name with image           | Logged in user with username "Batman"                                                                    | - too long planet name <br> - valid image           | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide too long planet name <br> 4. provide valid image <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium   | User should not be able to see the added planet                                        | Planet is not added, user is informed with an alert that something went wrong, please try again. | Kat    | Passed |
| 7   | Negative Use Case Scenario: Blank planet name with image              | Logged in user with username "Batman"                                                                    | - blank planet name <br> - valid image              | 1. get to homepage <br> 2. pick planet from drop down <br> 3. leave planet name blank <br> 4. provide valid image <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium        | User should not be able to see the added planet                                        | Planet is not added, user is informed with an alert that something went wrong, please try again. | Kat    | Passed |
| 8   | Negative Use Case Scenario: Non-unique planet name without image      | Logged in user with username "Batman"<br>Added planet with name "Earth"                                  | - non-unique planet name <br> - valid image         | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide non-unique planet name <br> 4. leave image blank <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium   | User should not be able to see the added planet                                        | Planet is not added, but user is not informed with an alert that something went wrong.           | Kat    | Failed |
| 9   | Negative Use Case Scenario: Non-unique moon name without image        | Logged in user with username "Batman"<br>Added moon without name "Luna"                                  | - non-unique moon name <br> - valid image           | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide non-unique moon name <br> 4. leave image blank <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium     | Planet is not added, but user is not informed with an alert that something went wrong. | Kat                                                                                              | Failed |
| 10  | Negative Use Case Scenario: Too long planet name without image        | Logged in user with username "Batman"                                                                    | - too long planet name <br> - valid image           | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide too long planet name <br> 4. leave image blank <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium     | User should not be able to see the added planet                                        | Planet is not added, but user is not informed with an alert that something went wrong.           | Kat    | Failed |
| 11  | Negative Use Case Scenario: Blank planet name without image           | Logged in user with username "Batman"                                                                    | - blank planet name <br> - valid image              | 1. get to homepage <br> 2. pick planet from drop down <br> 3. leave planet name blank <br> 4. leave image blank <br> 5. click submit planet<br> 6. user should be informed planet was not added to the planetarium          | User should not be able to see the added planet                                        | Planet is not added, but user is not informed with an alert that something went wrong.           | Kat    | Failed |

## Users should be able to remove Planets from the Planetarium

- Name: planet removal
- Description: Users should be able to remove Planets from the Planetarium
- System: Planetarium application
- Preconditions:
  - Logged in user with username "Batman!" and owner id “1”
  - User’s existing planet with name “User’s planet2” without associated moon
  - User’s existing planet with name “User’s planet with moon2” with associated moon with name “User’s associated moon2”
  - Other user’s existing planet with name “Other user’s planet2” without associated moon
  - Other user’s existing planet with name “Other user’s planet with moon2” with associated moon with name “Other user’s associated moon2”
  - Existing planet with name “Planet .^$\*+-?()[]{}\|”
  - No existing planet with name "This is not a planet"
- Actors:
  - User (logged into existing account)
  - Planetarium application

### Use Case Data

- Homepage URL = http://localhost:8080/planetarium
- User’s planet name with associated moon = "User’s planet with moon2"
- User’s planet name without associated moon = "User’s planet2"
- Other user’s planet name with associated moon = "Other user’s planet with moon2"
- Other user’s planet name without associated moon = "Other user’s planet2"
- Existing planet with name "Planet .^$\*+-?()[]{}\|"
- invalid planet name = "This is not a planet so it cannot be deleted"
- blank planet name

### Decision Table

| Scenario                                                                           | Planet Name                               | Result             |
| ---------------------------------------------------------------------------------- | ----------------------------------------- | ------------------ |
| Positive Use Case Scenario: User's valid planet name without associated moon       | valid planet name without associated moon | planet removed     |
| Positive Use Case Scenario: User's valid planet name with associated moon          | valid planet name with associated moon    | planet removed     |
| Positive Use Case Scenario: Other user's valid planet name without associated moon | valid planet name without associated moon | planet removed     |
| Positive Use Case Scenario: Other user's valid planet name with associated moon    | valid planet name with associated moon    | planet removed     |
| Positive Use Case Scenario: valid special character planet name                    | valid special character planet name       | planet removed     |
| Negative Use Case Scenario: Invalid planet name                                    | invalid planet name                       | planet not removed |
| Negative Use Case Scenario: Blank planet name                                      | blank planet name                         | planet not removed |

### Test Cases

| Id  | Description                                                                        | Preconditions                                                                                                     | Test Data                                   | Steps                                                                                                                                                                                    | Expected Outcome                                  | Actual Outcome                          | Tester | Status |
| --- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- | --------------------------------------- | ------ | ------ |
| 1   | Positive Use Case Scenario: User's valid planet name without associated moon       | Logged in user with username "Batman"<br>Added planet with name "User’s planet2"                                  | - valid planet name without associated moon | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide valid planet name without associated moon<br> 5. click delete<br> 6. planet should be deleted from the planetarium | User should be not able to see the deleted planet | Planet was removed from the Planetarium | Kat    | Passed |
| 2   | Positive Use Case Scenario: User's valid planet name with associated moon          | Logged in user with username "Batman"<br>Added planet with name "User’s planet with moon2"                        | - valid planet name with associated moon    | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide valid planet name with associated moon <br> 5. click delete<br> 6. planet should be deleted from the planetarium   | User should be not able to see the deleted planet | Planet was removed from the Planetarium | Kat    | Passed |
| 3   | Positive Use Case Scenario: Other user's valid planet name without associated moon | Logged in user with username "Batman"<br>Added planet with name "Other user’s planet2"                            | - valid planet name without associated moon | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide valid planet name without associated moon<br> 5. click delete<br> 6. planet should be deleted from the planetarium | User should be not able to see the deleted planet | Planet was removed from the Planetarium | Kat    | Passed |
| 4   | Positive Use Case Scenario: Other user's valid planet name with associated moon    | Logged in user with username "Batman"<br>Added planet with name "Other user’s planet with moon2"                  | - valid planet name with associated moon    | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide valid planet name with associated moon <br> 5. click delete<br> 6. planet should be deleted from the planetarium   | User should be not able to see the deleted planet | Planet was removed from the Planetarium | Kat    | Passed |
| 5   | Positive Use Case Scenario: Valid special character planet name                    | Logged in user with username "Batman"<br>Existing planet with name "Planet .^$\*+-?()[]{}\|"                      | - valid planet name with associated moon    | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide valid planet name with associated moon <br> 5. click delete<br> 6. planet should be deleted from the planetarium   | User should be not able to see the deleted planet | user was informed planet removal failed | Kat    | Failed |
| 6   | Negative Use Case Scenario: Invalid planet name                                    | Logged in user with username "Batman"<br>No added planet with name "This is not a planet so it cannot be deleted" | - invalid planet name                       | 1. get to homepage <br> 2. pick planet from drop down <br> 3. provide invalid planet name<br> 5. click delete<br> 6. user should be informed planet removal failed                       | user should be informed planet removal failed     | user was informed planet removal failed | Kat    | Passed |
| 7   | Negative Use Case Scenario: Blank planet name                                      | Logged in user with username "Batman"<br>                                                                         | - blank planet name                         | 1. get to homepage <br> 2. pick planet from drop down <br> 3. leave planet name blank<br> 5. click delete<br> 6. user should be informed planet removal failed                           | user should be informed planet removal failed     | user was informed planet removal failed | Kat    | Passed |

## Users should be able to add Moons to the Planetarium associated with a Planet

- Name: moon addition
- Description: Users should be able to add Moons to the Planetarium associated with a Planet
- System: Planetarium application
- Preconditions:
  - Logged in user with username "Batman!" and owner id “1”
  - Existing planet with name “Earth”
  - Existing moon with name “Luna”
  - User’s existing planet with name “User’s planet” without associated moon
  - User’s existing planet with name “User’s planet with moon” with associated moon with name “User’s associated moon”
  - Other user’s existing planet with name “Other user’s planet” without associated moon
  - Other user’s existing planet with name “Other user’s planet with moon” with associated moon with name “Other user’s associated moon”
  - No existing moon/planet with name “This is a newly made up moon”
  - No existing moon/planet with name ”.^$\*+-?()[]{}\|"
- Actors:
  - User (logged into existing account)
  - Planetarium application

### Use Case Data

- Homepage URL = http://localhost:8080/planetarium
- valid moon name = "This is a newly made up moon!!"
- valid special character moon name = ”.^$\*+-?()[]{}\|"
- too long moon name = "This moon wont want to exist!!!"
- non-unique planet name = "Earth"
- non-unique moon name = "Luna"
- user’s planet id = 3
- user’s planet with moon id = 4
- other user’s planet id = 6
- other user’s planet with moon id = 7

### Decision Table

| Scenario                                                                   | Moon Name            | Planet Id         | Image       | Result               |
| -------------------------------------------------------------------------- | -------------------- | ----------------- | ----------- | -------------------- |
| Positive Use Case Scenario: Valid moon name, valid planet id with image    | valid moon name      | valid planet id   | valid image | moon added           |
| Positive Use Case Scenario: Valid moon name, valid planet id without image | valid moon name      | valid planet id   | N/A         | moon added           |
| Negative Use Case Scenario: Non-unique moon name                           | non-unique moon name | valid planet id   | valid image | moon added not added |
| Negative Use Case Scenario: Too long moon name                             | too long moon name   | valid planet id   | valid image | moon added not added |
| Negative Use Case Scenario: Blank moon name                                | blank moon name      | valid planet id   | valid image | moon added not added |
| Negative Use Case Scenario: Invalid planet id                              | valid moon name      | invalid planet id | valid image | moon added not added |
| Negative Use Case Scenario: Blank planet id                                | valid moon name      | blank planet id   | valid image | moon added not added |

### Test Cases

| Id  | Description                                                               | Preconditions                                                                                                               | Test Data                                                      | Steps                                                                                                                                                                                                                             | Expected Outcome                                 | Actual Outcome                              | Tester | Status |
| --- | ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------- | ------ | ------ |
| 1   | Positive Use Case Scenario: Valid moon name, valid planet id with image   | Logged in user with username "Batman"<br>Added planet with id 1<br>No added moon with name "This is a newly made up moon!!" | - valid moon name<br>- valid planet id <br> - valid image      | 1. get to homepage <br> 2. pick moon from drop down <br> 3. provide valid moon name <br> 4. provide valid planet id <br> 5. provide valid image <br> 6. click submit moon<br> 6. moon should be added to the planetarium          | User should be able to see the added moon        | Moon addition fields did not become visible | Kat    | Failed |
| 2   | Positive Use Case Scenario:Valid moon name, valid planet id without image | Logged in user with username "Batman"<br>Added planet with id 1<br>No added moon with name "This is a newly made up moon!!" | - valid moon name<br>- valid planet id <br>                    | 1. get to homepage <br> 2. pick moon from drop down <br> 3. provide valid moon name <br> 4. provide valid planet id <br> 5. leave image blank <br> 6. click submit moon<br> 6. moon should be added to the planetarium            | User should be able to see the added moon        | Moon addition fields did not become visible | Kat    | Failed |
| 3   | Negative Use Case Scenario: Non-unique moon name                          | Logged in user with username "Batman"<br>Added planet with id 1<br>Added moon with name "Luna"                              | - non-unique moon name<br>- valid planet id <br> - valid image | 1. get to homepage <br> 2. pick moon from drop down <br> 3. provide non-unique moon name <br> 4. provide valid planet id <br> 5. provide valid image <br> 6. click submit moon<br> 6. moon should not be added to the planetarium | User should be informed the moon addition failed | Moon addition fields did not become visible | Kat    | Failed |
| 4   | Negative Use Case Scenario: Too long moon name                            | Logged in user with username "Batman"<br>Added planet with id 1<br>                                                         | - too long moon name<br>- valid planet id <br> - valid image   | 1. get to homepage <br> 2. pick moon from drop down <br> 3. provide too long moon name <br> 4. provide valid planet id <br> 5. provide valid image <br> 6. click submit moon<br> 6. moon should not be added to the planetarium   | User should be informed the moon addition failed | Moon addition fields did not become visible | Kat    | Failed |
| 5   | Negative Use Case Scenario: Blank moon name                               | Logged in user with username "Batman"<br>Added planet with id 1<br>                                                         | - blank moon name<br>- valid planet id <br> - valid image      | 1. get to homepage <br> 2. pick moon from drop down <br> 3. leave moon name blank<br> 4. provide valid planet id <br> 5. provide valid image <br> 6. click submit moon<br> 6. moon should not be added to the planetarium         | User should be informed the moon addition failed | Moon addition fields did not become visible | Kat    | Failed |
| 6   | Negative Use Case Scenario: Invalid planet id                             | Logged in user with username "Batman"<br>No added planet with id 7<br>                                                      | - valid moon name<br>- invalid planet id <br> - valid image    | 1. get to homepage <br> 2. pick moon from drop down <br> 3. provide valid moon name <br> 4. provide invalid planet id <br> 5. provide valid image <br> 6. click submit moon<br> 6. moon should not be added to the planetarium    | User should be informed the moon addition failed | Moon addition fields did not become visible | Kat    | Failed |
| 7   | Negative Use Case Scenario: Blank planet id                               | Logged in user with username "Batman"<br                                                                                    | - valid moon name<br> - valid image                            | 1. get to homepage <br> 2. pick moon from drop down <br> 3. provide valid moon name <br> 4. leave planet id blank<br> 5. provide valid image <br> 6. click submit moon<br> 6. moon should not be added to the planetarium         | User should be informed the moon addition failed | Moon addition fields did not become visible | Kat    | Failed |

## Users should be able to remove Moons from the Planetarium

- Name: moon removal
- Description: Users should be able to remove Moons from the Planetarium
- System: Planetarium application
- Preconditions:
  - Logged in user with username "Batman!" and owner id “1”
  - User’s existing planet with name “Mars” with associated moon with name “Titan”
  - Other user’s existing planet with name “Saturn” with associated moon with name “Rhea”
  - No existing moon with name “This is not a moon”
  - Existing moon with name “Moon .^$\*+-?()[]{}\|”
- Actors:
  - User (logged into existing account)
  - Planetarium application

### Use Case Data

- Homepage URL = http://localhost:8080/planetarium
- valid user’s moon name = "Titan"
- valid other user’s moon name = "Rhea"
- valid special character moon name = "Moon .^$\*+-?()[]{}\|"
- invalid moon name = "This is not a moon"

### Decision Table

| Scenario                                                      | Planet Name                       | Result           |
| ------------------------------------------------------------- | --------------------------------- | ---------------- |
| Positive Use Case Scenario: Valid user's moon name            | valid user's moon name            | moon removed     |
| Positive Use Case Scenario: Valid other user's moon name      | valid other user's moon name      | moon removed     |
| Positive Use Case Scenario: Valid special character moon name | valid special character moon name | moon removed     |
| Negative Use Case Scenario: Invalid moon name                 | invalid moon name                 | moon not removed |
| Negative Use Case Scenario: Blank moon name                   | blank moon name                   | moon not removed |

### Test Cases

| Id  | Description                                                   | Preconditions                                                                                                                  | Test Data                           | Steps                                                                                                                              | Expected Outcome                                    | Actual Outcome                             | Tester | Status |
| --- | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------ | ------ | ------ |
| 1   | Positive Use Case Scenario: Valid user's moon name            | Logged in user with username "Batman"<br>User’s existing planet with name “Mars” with associated moon with name “Titan”        | - valid user's moon name            | 1. get to homepage <br> 2. provide valid moon name<br> 5. click delete<br> 6. moon should be deleted from the planetarium          | User should be not able to see the deleted moon     | Moon was removed from the Planetarium      | Kat    | Passed |
| 2   | Positive Use Case Scenario: Valid other user's moon name      | Logged in user with username "Batman"<br>Other user’s existing planet with name “Saturn” with associated moon with name “Rhea” | - valid other user's moon name      | 1. get to homepage <br> 2. provide valid moon name<br> 5. click delete<br> 6. moon should be deleted from the planetarium          | User should be not able to see the deleted moon     | Moon was removed from the Planetarium      | Kat    | Passed |
| 3   | Positive Use Case Scenario: Valid special character moon name | Logged in user with username "Batman"<br>Existing moon with name “Moon .^$\*+-?()[]{}\|”                                       | - valid special character moon name | 1. get to homepage <br> 2. provide valid moon name<br> 5. click delete<br> 6. moon should be deleted from the planetarium          | User should be not able to see the deleted moon     | User was informed the moon deletion failed | Kat    | Failed |
| 4   | Negative Use Case Scenario: Invalid moon name                 | Logged in user with username "Batman"<br>No existing moon with name"This is not a moon"                                        | - invalid moon name                 | 1. get to homepage <br> 2. provide invalid moon name<br> 5. click delete<br> 6. moon should be not be deleted from the planetarium | User should be be informed the moon deletion failed | User was informed the moon deletion failed | Kat    | Passed |
| 5   | Positive Use Case Scenario: Blank moon name                   | Logged in user with username "Batman"                                                                                          | N/A                                 | 1. get to homepage <br> 2. leave moon name blank<br> 5. click delete<br> 6. moon should not be deleted from the planetarium        | User should be informed the moon deletion failed    | User was informed the moon deletion failed | Kat    | Passed |
