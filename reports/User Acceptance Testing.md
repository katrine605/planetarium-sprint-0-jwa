# Planetarium User Acceptance Testing

## Evaluation of Intuitiveness, Usability, Confidence and Aesthetics of the Planetarium Application

The Planetarium is a web application designed by Revature Space Initiative for astronomers to track celestial bodies they discover in the night sky. The user experience evaluation will address the following four questions to help improve product quality:

1. [Is the intended use of the service intuitive?](#is-the-intended-use-of-the-service-intuitive)
2. [Is the service easy to use?](#is-the-service-easy-to-use)
3. [Does the service inspire confidence?](#does-the-service-inspire-confidence)
4. [Is the service pleasing to look at?](#is-the-service-pleasing-to-look-at)

## Is the intended use of the service intuitive?

### Can users easily understand and navigate the application without extensive instruction or prior experience?

- The login/create an account pages offer no insight into what the application is/can be used for.
- The create an account button is so small that it can be easily overlooked
- The only option visible on the homepage is to perform a delete function.
- The placeholder for the delete input asks for the name of the “celestial body”, but it does not clarify that the moon/planet selection from the dropdown determines what type of celestial body can be deleted
- The “choose file” button does not indicate anywhere that it is meant for a moon/planet image

#### Evaluation:

The planetarium application would not be considered intuitive at this moment in time. It would be helpful to add a little information regarding the goal of the app on the login/create account page. The small size of the create an account button on the register page could prevent users from registering an account if overlooked, so the button would benefit from a size increase. While the dropdown button on the homepage does have a downwards arrow and you can choose planet as an option instead, the initial thought is that the only ability of this application is to delete existing moons/planets. It would be beneficial to also include the moon submission form on the homepage from the get go, to make sure users are aware of that addition feature straight away. Renaming the choose file button to choose image would clarify any concerns for what is required, however, since a planet/moon can be added without an image, that needs to be explicitly stated or change the button name to “do you want to include an image?”.

### Is the service easy to use?

#### Can users easily navigate and perform tasks within the application?

- There is no back button on the create an account page, which is needed if a user remembered they have an existing account and need to log in instead
- There is no option to filter through the added elements, which does not allow for a good overview
- Error messages are vague and are not always provided to the user when an action cannot be completed.
- Previously entered input does not disappear after form submission

#### Evaluation:

The application is relatively easy to use, as the app only provides basic functionalities. However, there is no back button on the create an account page, which is needed if a user remembered they have an existing account and need to go back to the login page instead. The application does not have a filter option, nor does it provide a good overview of the added planets and moons or their relationships to one another. This could be problematic as deleting planets with moons, also causes the associated moons to be deleted and you need planet ids to create associated moons. The error messages that the user receives when a submission fails is very vague. This should be updated to include a more detailed description of the error, so the user can correct it and move on with using the app. Any previously entered inputs (text and files) are not automatically deleted when a submission is successful. This means that a user will either have to manually delete the info or refresh the page after every action, making the task completions less efficient.

### Does the service inspire confidence?

#### Does the application include security features and does it recover from issues without crashing?

- The error messages alerting the user of an issue are vague
- The design quality does not promote professionalism or trust.

#### Evaluation:

The application inspires a low to medium level of confidence, brought down by current level of design quality. The application includes basic data validation and user authentication to protect user data. It also performs reliably under typical use cases and is able to recover from issues without crashing. However, it would be recommended to update the error messages with more a detailed response regarding the error, as well as updating the design to a more clean and polished look, as both could enhance user trust and confidence in the application.

### Is the service pleasing to look at?

#### Is the application’s design visually appealing and consistent throughout the app?

- The application’s images do not seem to be responsive, as they do not resize with the rest of the layout of the application
- The background distracts from the use of the application
- The sizing of input fields and buttons are not consistent
- The application does not have an inviting color palette and the typography is outdated
- Planet/Moon cards need to only include necessary data, as well as a visual representation of the relationships

#### Evaluation:

The current design of the application has a very outdated feel, while also lacking a visual appeal. From a layout point of view, the images need to responsive and the application needs to use consistent sizing and spacing when it comes to buttons and inputs. The moving background is distracting from the use of the application and should be replaced with a static background, and a cohesive and more modern color palette and typography that relates to the celestial theme should also be included. The planet/moon detail cards need to be more visually appealing and only include the necessary data. A visual representation of the relationships between planets and moons should also be included. Overall, the entire application should be redesigned in order to positively impact the user’s overall impression of the application.
