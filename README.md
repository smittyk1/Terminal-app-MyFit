# R5
The terminal application will be a fitness app. 
- It will allow the user to select a desired muscle group they want to train. The application will then give them a small workout focusing on training that muscle. It will provide exercises, the rep ranges that the user should aim for, and information on how to conduct these exercises with correct form.
- The application will also assist with nutrition. The user will be prompted to enter details such as sex, height, weight and age. With this information the app will be able to generate the user's BMR and TDEE. With this info the app will assist the user in understanding what their maintenance is (the daily caloric intake they require to maintain their current weight). With this information the user can simply add or subtract to this number depending on their goals (gain or lose weight).
- Thirdly, the app will provide a motiviational quote and a helpful fitness tip to not only educate the user further but also inspire them to achieve their goals.

This application will provide valuable information to help people meet their fitness goals. It will help to reduce the user's misconceptions of areas pertaining to fitness and allow them to progress in their fitness journey more efficiently. It is common that a lack of simple knowledge in areas of fitness and nutrition prevent, frustrate and discourage people from improving themselves. This app will help bridge the gap of knowledge and give people the valuable information they need to achieve their goals. I'm developing this app so that fitness becomes a more accessible hobby/interest. By developing it, I hope to get more people involved in an active and health concious lifestyle whilst reducing the intimidation some people may feel towards fitness. I also hope that it will reduce some of the misconceptions people have surrounding it and encourage them to embrace where they are now and where they want to be. The app is designed to target anyone with an interest in getting into fitness. All ages can participate, anyone who has the desire to live a healthier and more active lifestyle. A member of the target audience will use it to determine the caloric intake they need to meet their goals (lose, gain or maintain weight). They will also utilise the app the create workout plans that will improve their strength and endurance. When feeling demoralisied, the individual will also be able to use it to motivate them and receive reccomendations as to what they should include and exclude from their diet.

# R6
- Feature: Exercise
    - This feature will assist the user in creating a workout based on a desired muscle group. Each workout will be a multi-dimensional array stored in individual variables. Based on the choice of muscle group, the app will display the array in a table format for the user to pick and choose from. The user will receive advice on what combination of exercises to pick, how they should be done, and how many reps they should be doing of each to conduct an effective workout. If the user enters an invalid option, they will be told so. This feature will give the user more options when it comes to formulating a workout and will ensure that they work the muscle they intend regardless of knowledge.
- Feature: Nutrition
    - This feature will give the user valuable information on food and their caloric intake. By making use of ruby gems, the app will store information the user gives in variables and use that information to generate the users BMI, BMR and TDEE, all valuable things for understanding the health and caloric needs of the user. With this feature the user will better understand their diet and health needs. This feature will also inform the user of foods that are good for either gaining weight or losing weight. As a whole, this feature siginificantly assists the user with controlling their daily intake to meet their fitness goals.
- Feature: Motivate
    - This feature will simply help encourage the user to stick to their fitness and health lifestyle. It will randomly generate motivational quotes from a pool of options and also generate useful daily tips relating to anything in the realm of active life habits. By adding this feature it will help to prevent a common issue in fitness, giving up. This will push the user to continue making use of the application's other features to remain consistent and encouraged throughout their fitness journey.

# R7
- The user will interact with each feature of the application through instructions and prompts they are provided. The application clearly states at each step what it wants from the user. This ensures that the correct answer is often provided and neccessary error handling is minimal. The user is given a list of options adequetly titled, they will select an option and the application will lead them from there. The user will provide information based on themselves and what they want to do within the application in order to receive the answers that they're looking for. This ensures that the application runs smoothly and the user is able to fully utilise each feature. When an error does occur, the user will be informed and re-prompted for a correct answer. At any point the user will be able to exit the application if neccessary.

# R8
![flowchart](docs/flowchart.png)

# R9
https://trello.com/b/RDov4A3A/terminal-application

# R10
## How to Install
- Install the source code from https://github.com/smittyk1/Terminal-app-MyFit 
- Navigate to MyFit.rb on your terminal
- If you do not have bundler installed, type 'install bundler' into your terminal
- Once installed, type 'bundle install' to aquire the gems of the application
- Type MyFit.rb to run the application

## System requirements
- Best run on a MAC OS
- the gen dependencies are as follows:
    - bmi (~> 0.2.0)
    - colorize (~> 0.8.1)
    - rspec (~> 3.9)
    - rubybody (~> 0.0.3)
    - terminal-table (~> 1.8)
    - tty-progressbar (~> 0.17.0)
    - tty-prompt (~> 0.22.0)