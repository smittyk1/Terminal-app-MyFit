# Ruby gems used in this application
require 'terminal-table'
require 'rubybody'
require 'bmi'
require 'colorize'
require 'tty-progressbar'
require 'tty-prompt'

# Methods used in this application
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
    ["Type-\nwriter\nPushup", "8 - 10", " 1. Start in a wide pushup position with hands facing out \n 2. Lower yourself like any other pushup movement \n 3. At the bottom of the movement, shift your weight onto one arm \n 4. Hold then switch to your other arm (keeping chest close to ground) \n 5. Bring yourself back to the center and push up to complete the rep", "Too hard? \n practice holding the movement at the bottom \nToo easy? \n Explode off the ground at the top of the movement" ],
    ["Explode\nNegative\n Pushup", "5 - 10", " 1. In pushup position, lower your chest to the ground \n 2. When lowering yourself, do it as slow as possible \n 3. Hold at the bottom \n 4. Push with explosive power \n 5. Ensure your hands come off the ground at end of movement", "Too hard? \n Do it with your hands on an elevated surface \nToo easy? \n make a single rep take a whole minute to complete"]
]

back_ex = [
    ["Australian\nPullup", "12 - 15", " 1. Hold onto a low bar with your body straight and heels on the ground \n 2. Pull your chest to the bar \n 3. Hold and squeeze your back \n 4. Slowly extend arms to lower yourself", "Too hard? \n Situate a resistance band around your back\n and hold it between your palm and the bar\nToo easy? \n Elevate your feet"],
    ["Pullup", "8 - 10", " 1. Hold onto bar and let lats extend \n 2. Shrug to squeeze traps and bring shoulderblades together \n 3. Pull up by allowing elbows to drive down towards the ground \n 4. Squeeze once upper chest comes to bar \n 5. Lower yourself with controle", "Too hard?\n Do jumping negative pullups\nToo easy?\n Attempt a muscle up or archer pullup"],
    ["Straight\narm\nLat pull", "8 - 12", " 1. Hold onto bar with arms extended and knees tucked \n 2. Keeping arms straight, pull knees to bar \n 3. Squeeze lats and slowly lower knees down", "Too hard?\n Hold the horizontal position\n with a resistance band\nToo easy? \n Do it with one or both legs\n held straight out"],
    ["Chinup", "10 - 12", "1. Hold bar with a reversed grip \n 2. Bring chest to bar by pulling elbows down and back\n 3. Squeeze traps and biceps at top of movement \n 4. Slowly lower yourself whilst still squeezing", "Too hard? \n Try Australian chinups \nToo easy? \n When lowering yourself, try\n using only one arm"],
    ["Commando\n Pullup", "6 - 10", "1. Grip bar with both hands together \n 2. Keeping body straight, pull to your shoulder \n 3. alternate with each rep, pulling to different shoulder\n 4. Slowly lower after each rep", "Too hard? \n Jump to pull yourself up \nToo easy? \n Release one hand when lowering yourself"]
]

arm_ex = [
    ["Diamond\nPushup", "10 - 12", " 1. Get into a push up position \n 2. Touch your thumbs and index fingers together to make a diamond \n 3. Bend elbows and touch chest to diamond shape \n 4. Ensure elbows are tucked in \n 5. Explode up with the help of triceps", "Too hard? \n Do it from your knees \nToo easy? \n Elevate your feet"],
    ["Bodyweight\n Tricep\nExtension", "8 - 12", " 1. Get into a high plank position \n 2. Hands shoulder width apart, lower elbows to ground\n 3. Hold whilst forearms lay flat on the ground \n 4. Use triceps to extend arms staight again and push bodyweight back up", "Too hard? \n The further your face is away from\n your hands, the easier it will be\nToo easy?\n Try the 'impossible' dip"],
    ["Pseudo\nPushup", "12 - 15", " 1. Start in a pushup position with fingers pointed to your feet \n 2. Push with your toes to slightly lean forward \n 3. Lower yourself with your elbows tucked in \n 4. Explode up until arms are straight", "Too hard? \n Put your hands on an elevated surface\nToo easy? \n Invest in a weight vest"],
    ["headbangers", "10 - 12", " 1. Get into a chinup position \n 2. Pull yourself up \n 3. Instead of going down, extend your arms \n 4. Retract your arms like you're curling yourself \n 5. The movement looks like you're banging your head on the bar", "Too hard? \n Do a bodyweight curl on a low bar \nToo easy? \n Do them in slow motion"],
    ["Australian\nChinup", "12 - 15", " 1. Grab onto a low bar with a reversed grip \n 2. Bring your elbows back til your chest touches the bar \n 3. Hold and squeeze biceps \n 4. Slowely extend your arms back down", "Too hard? \n Do a resistance band bicep curl \nToo easy? \n Do chinups"],
    ["Hefesto", "5", " 1. Grip a low bar behind your back \n 2. Lean forward and allow feet to lift off ground \n 3. Keep elbows bent and hold \n 4. Extend arms and lower your bodyweight \n 5. Release grip and repeat", "Too hard? \n Wrap a resistance band around your waist \nToo easy? \n After extending, pull your lower back back to the bar"],
    ["Tricep\nExtension", "12 - 15", " 1. Facing a low bar, grip it \n 2. Get on your toes and lean forward \n 3. Lower your head below/past the low bar, allowing elbows to bend \n 4. Use your triceps to extend arms and push back to start position", "Too hard? \n Use a higher bar \nToo easy? \n Use a lower bar"]
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
    ["Greek Yogurt", "60 calories per 100g \nGood source of protein"],
    ["Berries(straw, blue, rasp)", "84 calories per 1 cup \nBenefitial fibre and vitamins"],
    ["Eggs", "70 calories per egg \nReduces hunger by boosting fullness"],
    ["Popcorn", "31 calories per cup \nRich in fibre and very satiating"],
    ["Cod(fish)", "189 calories per fillet(231g) \nIncredibly high in protein \nEssential healthy fats"],
    ["Cottage Cheese", "160 calories per cup(226g) \nLot's of combinations for snack ideas"],
    ["Watermelon", "46 calories per cup (152g) \nHigh water content hydrates you"]
]

highcal = [
    ["Peanutbutter", "588 calories per 100 grams \nCan be incorporated into lots of meal ideas \nEasy to consume"],
    ["Full-cream Milk", "150 calories per 250ml \nReplenishes electrolytes \nStrong source of calcium, vitamins and minerals"],
    ["Nuts", "600 - 800 calories per cup (137g) \nIncredibly calorie-dense \nVery easy to consume \nHealthy fats"],
    ["Salmon", "360 calories per fillet(150g) \nEssential source of omega-3 \nProtein-rich"],
    ["Avocado", "250 - 350 calories per avocado \nHealthy source of fats"],
    ["Dark Chocolate", "600 calories per 100g \nGreat cheat meal snack \nRich in antioxcidents"],
    ["Oatmeal", "160 calories per cup(234g) \nHigh source of carbs and fibre \nCombine with protein powder and berries"],
    ["Honey", "65 calories per tbsp(21g) \nCan be mixed into lost of foods to boost calories \nA natural sweetner"]
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
table_chest = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => chest_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Complete them in a circuit with little to no rest between each exercise \n Rest for 2 - 4 minutes before completing the circuit again. Complete the circuit at least 4 times", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_back = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => back_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Complete them in a circuit with little to no rest between each exercise \n Rest for 2 - 4 minutes before completing the circuit again. Complete the circuit at least 4 times", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_arms = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => arm_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Complete them in a circuit with little to no rest between each exercise \n Rest for 2 - 4 minutes before completing the circuit again. Complete the circuit at least 4 times", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
table_shoulders = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => shoulder_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Complete them in a circuit with little to no rest between each exercise \n Rest for 2 - 4 minutes before completing the circuit again. Complete the circuit at least 4 times", :style => {:border_x => "=", :border_i => "x", :all_separators => true} 
table_legs = Terminal::Table.new :headings => ['Exercise', 'Rep-range', 'Technique', 'Assistance'], :rows => leg_ex, :title => "Workout \n Select at least 4 exercises from the list below \n Complete them in a circuit with little to no rest between each exercise \n Rest for 2 - 4 minutes before completing the circuit again. Complete the circuit at least 4 times", :style => {:border_x => "=", :border_i => "x", :all_separators => true}
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
        clear_screen
        if input == "return"
            next
        else
            exit
        end
    when "4"
        puts table_highcal
        puts "When ready, type 'return' to go back to menu"
        input = gets.chomp
        clear_screen
        if input == "return"
            next
        else
            exit
        end
    else
        puts "Invalid Selection".colorize(:red)
    end
when "3"
    puts "
    
                                    ███    ███  ██████  ████████ ██ ██    ██  █████  ████████ ███████ 
                                    ████  ████ ██    ██    ██    ██ ██    ██ ██   ██    ██    ██      
                                    ██ ████ ██ ██    ██    ██    ██ ██    ██ ███████    ██    █████   
                                    ██  ██  ██ ██    ██    ██    ██  ██  ██  ██   ██    ██    ██      
                                    ██      ██  ██████     ██    ██   ████   ██   ██    ██    ███████ 
                                                                  
                                                                  

    "
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