# Ruby gems used in this application
require 'terminal-table'
require 'rubybody'
require 'bmi'
require 'colorize'
require 'tty-progressbar'
require 'tty-prompt'

#methods used in this application
def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
end

def array_shuffle(array)
    puts array.sample
end


# Arrays used to populate the exercise tables, divided based on muscle group
chest_ex = [
    ["Pushup", "12 - 15", " 1. Don't allow lower back to dip, keep back straight \n 2. Keep elbows tucked in, don't flair them out \n 3. Slowly bring yourself down with control \n 4. Pause with 1cm between your chest and the ground, hold 5 seconds \n 5. Explode up, locking out your elbows at the top of the motion", "Too hard? \n Use an elevated surface or do it from your knees \nToo easy? \n Wrap a resistance band around your back \n to add force" ],
    ["Decline\n Pushup", "10 - 15", " 1. Keep pushup technique in mind \n 2. Align hands with center of chest \n 3. Keep hands slightly wider than shoulder-width apart \n 4. Keep legs straight, feet together and core tight throughout movement", "Too hard? \n Reduce leg elevation or regress to pushup \nToo easy? \n Elevate hands for deeper range of motion"],
    ["Chest\n Dip", "10 - 12", " 1. Hold onto parallel bars with feet off the ground/elbows locked out \n 2. Lean forward to put emphasis on chest \n 3. Maintain lean whilst lowering yourself \n 4. Keep elbows tucked in throughout motion \n 5. Hold at bottom for a second then strictly push till elbows lockout", "Too hard?\n Place something for your feet to rest on\n whilst you do the movement\nToo easy? \n Invest in a weight vest! Or place a resistance\n band around the back of your neck"],
    ["Archer\nPushup", "5 - 8\nEach arm", " 1. Get into a pushup position but with hands wide apart \n 2. Ensure hands are facing outwards(fingers pointing out, not forward) \n 3. Lower yourself by bending only one arm \n 4. Keep opposite arm straight out (not allowing hand to move/slide) \n 5. Alternate arm each rep until completion", "Too hard?\n instead, elevate one hand slightly\n and conduct a normal pushup with more\n tension placed on lower arm\nToo easy?\n attempt a single-arm pushup"],
    ["Type-\nwriter\nPushup", "8 - 10", " 1. Start in a wide pushup position with hands facing out \n 2. Lower yourself like any other pushup movement \n 3. At the bottom of the movement, shift your weight onto one arm \n 4. Hold then switch to your other arm (keeping chest close to ground) \n 5. Bring yourself back to the center and push up to complete the rep" ],
    [""]
]

back_ex = [
    [],
    [],
    []
]

arm_ex = [
    [],
    [],
    []
]

shoulder_ex = [
    [],
    [],
    []
]

leg_ex = [
    [],
    [],
    []
]

lowcal = [
    ["Greek Yogurt", "60 calories per 100 grams \n Good source of protein"],
    ["Berries(straw, blue, rasp)", "84 calories per 1 cup \n benefitial fibre and vitamins"],
    ["Eggs", "70 calories per egg \n reduces hunger by boosting fullness"],
]

highcal = [
    [],
    [],
    [],
]

quotes = [
    "The last three or four reps is what makes the muscle grow. This area of pain divides a champion from someone who is not a champion. — Arnold Schwarzenegger", 
    "Success usually comes to those who are too busy to be looking for it. — Henry David Thoreau", 
    "All progress takes place outside the comfort zone. — Michael John Bobak", 
    "If you think lifting is dangerous, try being weak. Being weak is dangerous. — Bret Contreras", 
    "The only place where success comes before work is in the dictionary. — Vidal Sassoon", 
    "The clock is ticking. Are you becoming the person you want to be? — Greg Plitt", 
    "You must expect great things of yourself before you can do them. — Michael Jordan",
    "Action is the foundational key to all success. — Pablo Picasso",
    "Well done is better than well said. — Benjamin Franklin",
    "All our dreams can come true if we have the courage to pursue them. — Walt Disney",
    "A champion is someone who gets up when they can’t. — Jack Dempsey",
    "What hurts today makes you stronger tomorrow. — Jay Cutler",
    "If something stands between you and your success, move it. Never be denied. — Dwayne ‘The Rock’ Johnson",
    "If you want something you’ve never had, you must be willing to do something you’ve never done. — Thomas Jefferson",
    "You have to think it before you can do it. The mind is what makes it all possible. — Kai Greene",
    "Success is walking from failure to failure with no loss of enthusiasm. — Winston Churchill"
    ]

    tips = [
    "Tip: Always add progressive overload to your training. This may be in the form of increasing reps or weight each week, or simply decreasing rest time between exercises each week",
    "Tip: Value your form over everything else. 10 reps with perfect form are more beneficial than 20 reps with poor form",
    "Tip: Sleep is cruical. If you dont get your proper 7 - 9 hours sleep, you will see less progress",
    "Tip: Drink lot's of water each day, it will help your body in more ways than you know",
    "Tip: Let yourself have a cheat meal once a week, you've earned it and it will help you stick to your diet",
    "Tip: Don't compare yourself to others, everyone is on their own path in fitness",
    "Tip: Enjoy the process, those that succeed don't just focus on the end result, they love the journey aswell"
    ]

# styling and titling of various tables
table_chest = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => chest_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Pick at least 2 Green, 1 Yellow and 1 Red", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_back = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => back_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Pick at least 2 Green, 1 Yellow and 1 Red", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_arms = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => arm_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Pick at least 2 Green, 1 Yellow and 1 Red", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_shoulders = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => shoulder_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Pick at least 2 Green, 1 Yellow and 1 Red", :style => {:border_x => "=", :border_i => "x", :all_separators => true} 
table_legs = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => leg_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Pick at least 2 Green, 1 Yellow and 1 Red", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_lowcal = Terminal::Table.new :headings => ['Food', 'Information'], :rows => lowcal, :title => "Low-calorie foods", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_highcal = Terminal::Table.new :headings => ['Food', 'Information'], :rows => highcal, :title => "High-calorie foods", :style => {:border_x => "=", :border_i => "x", :all_separators => true}


clear_screen
puts "


                                                                                                                 
                                                                                                                 
                    MMMMMMMM               MMMMMMMM                              FFFFFFFFFFFFFFFFFFFFFF  iiii          tttt          
                    M:::::::M             M:::::::M                              F::::::::::::::::::::F i::::i      ttt:::t          
                    M::::::::M           M::::::::M                              F::::::::::::::::::::F  iiii       t:::::t          
                    M:::::::::M         M:::::::::M                              FF::::::FFFFFFFFF::::F             t:::::t          
                    M::::::::::M       M::::::::::Myyyyyyy           yyyyyyy       F:::::F       FFFFFFiiiiiiittttttt:::::ttttttt    
                    M:::::::::::M     M:::::::::::M y:::::y         y:::::y        F:::::F             i:::::it:::::::::::::::::t    
                    M:::::::M::::M   M::::M:::::::M  y:::::y       y:::::y         F::::::FFFFFFFFFF    i::::it:::::::::::::::::t    
                    M::::::M M::::M M::::M M::::::M   y:::::y     y:::::y          F:::::::::::::::F    i::::itttttt:::::::tttttt    
                    M::::::M  M::::M::::M  M::::::M    y:::::y   y:::::y           F:::::::::::::::F    i::::i      t:::::t          
                    M::::::M   M:::::::M   M::::::M     y:::::y y:::::y            F::::::FFFFFFFFFF    i::::i      t:::::t          
                    M::::::M    M:::::M    M::::::M      y:::::y:::::y             F:::::F              i::::i      t:::::t          
                    M::::::M     MMMMM     M::::::M       y:::::::::y              F:::::F              i::::i      t:::::t    tttttt
                    M::::::M               M::::::M        y:::::::y             FF:::::::FF           i::::::i     t::::::tttt:::::t
                    M::::::M               M::::::M         y:::::y              F::::::::FF           i::::::i     tt::::::::::::::t
                    M::::::M               M::::::M        y:::::y               F::::::::FF           i::::::i       tt:::::::::::tt
                    MMMMMMMM               MMMMMMMM       y:::::y                FFFFFFFFFFF           iiiiiiii         ttttttttttt  
                                                         y:::::y                                                                     
                                                        y:::::y                                                                      
                                                       y:::::y                                                                       
                                                      y:::::y                                                                        
                                                     yyyyyyy                                                                         
                                                                                                                 
                                                                                                                

"
loop do
 puts "
                            ██      ███████ ████████ ███████      ██████  ███████ ████████     ███████ ██ ████████ ██ 
                            ██      ██         ██    ██          ██       ██         ██        ██      ██    ██    ██ 
                            ██      █████      ██    ███████     ██   ███ █████      ██        █████   ██    ██    ██ 
                            ██      ██         ██         ██     ██    ██ ██         ██        ██      ██    ██       
                            ███████ ███████    ██    ███████      ██████  ███████    ██        ██      ██    ██    ██                                                                                                                                                                         
 " 
 puts "                                                       (Make a selection with 1 - 4)
                                                                1. Exercise
                                                                2. Nutrition
                                                                3. Motivate 
                                                                4. Exit "   
option = gets.chomp
clear_screen
case option
when "1"
    puts "What would you like to train? (chest, back, arms, shoulders, legs)"
    choice = gets.chomp
    clear_screen
    case choice.downcase
    when "chest"
        puts table_chest
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        clear_screen
        if input == "return"
            next
        else
            exit
        end
    when "back"
        puts table_back
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        if input == "return"
            next
        else
            exit
        end
    when "arms"
        puts table_arms
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        if input == "return"
            next
        else
            exit
        end
    when "shoulders"
        puts table_shoulders
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        if input == "return"
            next
        else
            exit
        end
    when "legs"
        puts table_legs
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        if input == "return"
            next
        else
            exit
        end
    else 
        puts "Invalid Selection".colorize(:red)
    end
when "2"
    puts "What would you like to know? Select an option (1 - 4)"
    puts "
1. I want to know if my current weight is healthy
2. I want to know how to change my current weight
3. I want to know some low-calorie foods that will help me lose weight
4. I want to know some high-calorie foods that will help me gain weight"
    choice = gets.chomp
    clear_screen
    case choice
    when "1"
        puts "To determine if your weight is healthy, we'll calculate your Body Mass Index (BMI)"
        bmi = BMI.new
        puts "How much do you weigh in kilograms? (No need to type kg after your answer)"
        bmi_weight = gets.chomp
        bmi.weight(bmi_weight.to_i)
        puts "How tall are you in metres? (No need to type m after your answer)"
        bmi_height = gets.chomp
        bmi.height(bmi_height)
        clear_screen
        puts "
       
    ██████╗ ███╗   ███╗██╗
    ██╔══██╗████╗ ████║██║
    ██████╔╝██╔████╔██║██║
    ██╔══██╗██║╚██╔╝██║██║
    ██████╔╝██║ ╚═╝ ██║██║
    ╚═════╝ ╚═╝     ╚═╝╚═╝          
        "
        bmi.calc
        puts "-------------------------------------------------------------------------------------------------"
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        clear_screen
        if input == "return"
            next
        else
            exit
        end
        
    when "2"
        puts "Let's calculate your BMR and TDEE! This will help you control your daily caloric intake"
        puts "What is your current weight in kilograms? (No need to type kg after your answer)"
        weight = gets.chomp
        puts "What is your current height in centimetres? (No need to type cm after your answer)"
        height = gets.chomp
        puts "How old are you?"
        age = gets.chomp
        puts "are you male or female?"
        sex = gets.chomp
        clear_screen
        person = Rubybody::Person.new(weight.to_i, height.to_i, age.to_i, sex.to_sym)
        s_weight_loss = person.tdee - 250
        m_weight_loss = person.tdee - 500
        s_weight_gain = person.tdee + 250
        m_weight_gain = person.tdee + 500

        bar = TTY::ProgressBar.new("Calculating [:bar]", total: 30)
        30.times do
        sleep(0.1)
        bar.resize(150)
        bar.advance(1)
        end
        clear_screen
        puts "
        
                                                                ██████╗ ███╗   ███╗██████╗ 
                                                                ██╔══██╗████╗ ████║██╔══██╗
                                                                ██████╔╝██╔████╔██║██████╔╝
                                                                ██╔══██╗██║╚██╔╝██║██╔══██╗
                                                                ██████╔╝██║ ╚═╝ ██║██║  ██║
                                                                ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝
        "
        puts "                                                 Your Basal Metabolic Rate (BMR) is #{person.bmr} calories a day."
        puts "                   This is the amount of energy your body will passivly burn in a day whilst rested (not participating in any physical activity)"
        puts "            This means that #{person.bmr} calories is the amount you need to consume to maintain your weight on days you do little to no energy-burning activity!"
                
        puts "        --------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "
        
                                                             ████████╗██████╗ ███████╗███████╗
                                                             ╚══██╔══╝██╔══██╗██╔════╝██╔════╝
                                                                ██║   ██║  ██║█████╗  █████╗  
                                                                ██║   ██║  ██║██╔══╝  ██╔══╝  
                                                                ██║   ██████╔╝███████╗███████╗
                                                                ╚═╝   ╚═════╝ ╚══════╝╚══════╝
        "
        puts "                                            Your Total Daily Energy Expenditure (TDEE) is #{person.tdee} calories a day."
        puts "                        This is the amount of energy your body will burn on days you are reasonably active (walking, running, exercise)"
    puts "                     This means that #{person.tdee} calories is your daily maintenance and can be considered the amount you will burn on MOST days"
           
        puts "        --------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts "
    
                                            ██████╗ ██╗   ██╗██████╗      █████╗ ██████╗ ██╗   ██╗██╗ ██████╗███████╗
                                           ██╔═══██╗██║   ██║██╔══██╗    ██╔══██╗██╔══██╗██║   ██║██║██╔════╝██╔════╝
                                           ██║   ██║██║   ██║██████╔╝    ███████║██║  ██║██║   ██║██║██║     █████╗  
                                           ██║   ██║██║   ██║██╔══██╗    ██╔══██║██║  ██║╚██╗ ██╔╝██║██║     ██╔══╝  
                                           ╚██████╔╝╚██████╔╝██║  ██║    ██║  ██║██████╔╝ ╚████╔╝ ██║╚██████╗███████╗
                                            ╚═════╝  ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═════╝   ╚═══╝  ╚═╝ ╚═════╝╚══════╝                                                   
        "
        puts "                               If you want to gain or lose weight in a safe and healthy way, stick to the following daily calories"
    puts "        (Keep in mind that everyone is different and you should moniter your weight gain/loss to adjust these numbers if you are gaining or losing too quickly)"
    puts "    
         "
                          puts "                                    If you want to lose weight gradually (0.25kg per week), eat #{s_weight_loss} calories a day"
                          puts "                                    If you want to lose weight at a quicker pace (0.5kg per week), eat #{m_weight_loss} calories a day"
                          puts "                                    If you want to gain weight gradually (0.25kg per week), eat #{s_weight_gain} calories a day"
                          puts "                                    If you want to gain weight at a quicker pace (0.5kg per week), eat #{m_weight_gain} calories a day"
        puts "        --------------------------------------------------------------------------------------------------------------------------------------------------------"                    
        puts ""                    
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        clear_screen
        if input == "return"
            next
        else
            exit
        end

    when "3"
        puts table_lowcal
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        if input == "return"
            next
        else
            exit
        end
    when "4"
        puts "FOUR"
    else
        puts "Invalid Selection".colorize(:red)
    end
when "3"
    puts ""
    array_shuffle(quotes)
    puts ""
    array_shuffle(tips)
    puts ""
    puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        clear_screen
        if input == "return"
            next
        else
            exit
        end
when "4" || "exit"
    (puts "Stay fit, stay active! You've got this!!") + exit
else
    puts "Invalid selection".colorize(:red)
end
end