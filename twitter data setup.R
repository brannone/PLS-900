#Run this set of code to create the data for the twitter hanldes. 
#This will combine them, and trim them down to just main accounts.

Senator <- c("Doug Jones", "Richard Shelby",  "Lisa Murkowski", "Lisa Murkowski", "Dan Sullivan", "John McCain", "Jeff Flake", "Tom Cotton", "Tom Cotton", "John Boozman", "Dianne Feinstein", "Dianne Feinstein", "Kamala Harris", "Kamala Harris", "Michael Bennet", "Michael Bennet", "Cory Gardner", "Cory Gardner", "Chris Murphy", "Richard Blumenthal", "Tom Carper", "Tom Carper", "Chris Coons", "Marco Rubio", "Bill Nelson", "Johnny Isakson", "Johnny Isakson", "David Perdue", "David Perdue", "Brian Schatz", "Brian Schatz", "Mazie Hirono", "Mazie Hirono", "Mike Crapo", "Jim Risch", "Tammy Duckworth", "Tammy Duckworth", "Dick Durbin", "Dick Durbin", "Todd Young", "Todd Young", "Joe Donnelly", "Chuck Grassley", "Joni Earnst", "Pat Roberts", "Jerry Moran", "Mitch McConnell", "Mitch McConnell", "Mitch McConnell", "Rand Paul", "Bill Cassidy", "John Kennedy", "John Kennedy", "Susan Collins", "Angus King", "Ben Cardin", "Chris Van Hollen", "Chris Van Hollen", "Elizabeth Warren", "Elizabeth Warren", "Ed Markey", "Ed Markey", "Debbie Stabenow", "Gary Peters", "Gary Peters", "Amy Klobuchar", "Tina Smith", "Tina Smith", "Thad Cochran", "Roger Wicker", "Roger Wicker", "Claire McCaskill", "Claire McCaskill", "Roy Blunt", "Jon Tester", "Jon Tester", "Steve Daines", "Steve Daines", "Deb Fischer", "Ben Sasse", "Ben Sasse", "Dean Heller", "Dean Heller", "Catherine Cortez Masto", "Catherine Cortez Masto", "Jeanne Shaheen", "Jeanne Shaheen", "Maggie Hassan", "Maggie Hassan", "Bob Menendez", "Bob Menendez", "Cory Booker", "Cory Booker", "Tom Udall", "Martin Heinrich", "Chuck Schumer", "Chuck Schumer", "Kirsten Gillibrand", "Richard Burr", "Richard Burr", "Thom Tillis", "Thom Tillis", "John Hoeven", "Heidi Heitkamp", "Heidi Heitkamp", "Sherrod Brown", "Sherrod Brown", "Rob Portman", "Rob Portman", "Jim Inhofe", "James Lankford", "Ron Wyden", "Jeff Merkley", "Jeff Merkley", "Bob Casey Jr.", "Pat Toomey", "Jack Reed", "Sheldon Whitehouse", "Sheldon Whitehouse", "Lindsey Graham", "Lindsey Graham", "Tim Scott", "Tim Scott", "John Thune", "John Thune", "Mike Rounds", "Lamar Alexander", "Bob Corker", "Bob Corker", "John Cornyn", "Ted Cruz", "Ted Cruz", "Orrin Hatch", "Mike Lee", "Patrick Leahy", "Bernie Sanders", "Bernie Sanders", "Mark Warner", "Mark Warner", "Tim Kaine", "Patty Murray", "Patty Murray", "Maria Cantwell", "Joe Manchin", "Joe Manchin", "Shelley Moore Capito", "Ron Johnson", "Tammy Baldwin", "Tammy Baldwin", "Mike Enzi", "John Barrasso")

Handles <- c('@DougJones', '@SenShelby','@lisamurkowski', "@LisaForSenate", "@SenDanSullivan", "@SenJohnMcCain", "@JeffFlake", "@TomCottonAR", "@SenTomCoton", "@JohnBoozman", "@SenFeinstein", "@DianneFeinstein", "@KamalaHarris", "@KamalaHarris", "@SenBennetCO", "@BennetForCO", "@CoryGardner", "@SenCoryGardner", "@ChrisMurphyCT", "@SenBlumenthal", "@SenatorCarper", "@TomCarperforDE", "@ChrisCoons", "@marcorubio", "@SenBillNelson", "@JSenatorIsakson", "@JohnnyIsakson", "@sendavidperdue", "@Perduesenate", "@brianschatz", "@SenBrianSchatz", "@maziehirono", "@mazieforhawaii", "@MikeCrapo", "@SenatorRisch", "@SenDuckworth", "@TammyforIL", "@SenatorDurbin", "@DickDurbin", "@SenToddYoung", "@ToddYoungIN", "@SenDonnelly", "@ChuckGrassley", "@SenJoniErnst", "@SenPatRoberts", "@JerryMoran", "@SenateMajLdr", "@McConnellPress", "@Team Mitch", "@RandPaul", "@BillCassidy", "@SenJohnKennedy", "@JohnKennedyLA", "@SenatorCollins", "@SenAngusKing", "@SenatorCardin", "@ChirsVanHollen", "@VanHollenForMD", "@SenWarren", "@elizabethforma", "@SenMarkey", "@EdMarkey", "@stabenow", "@SenGaryPeters", "@Peters4Michigan", "@amyklobuchar", "@SenTinaSmith", "@TinaSmithMN", "@SenThadCochran", "@SenatorWicker", "@RogerWicker", "@clairemc", "@McCaskillOffice", "@RoyBlunt", "@SenatorTester", "@jontester", "@SteveDaines", "@DainesforMT", "@SenatorFischer", "@BenSasse", "@SenSasse", "@SenDeanHeller", "@DeanHeller", "@SenCortezMasto", "@CatherineForNV", "@SenatorShaheen", "@JeanneShaheen", "@SenatorHassan", "@Maggie_Hassan", "@SenatorMenendez", "@Menendez4NJ", "@CoryBooker", "@SenBooker", "@SenatorTomUdall", "@MartinHeinrich", "@SenSchumer", "@chuckschumer", "@SenGillibrand", "@SenatorBurr", "@BurrForSenate", "@SenThomTillis", "@ThomTillis", "@SenJohnHoeven", "@SenatorHeitkamp", "@HeidiHeitkamp", "@SherrodBrown", "@SenSherrodBrown", "@senrobportman", "@robportman", "@JimInhofe", "@SenatorLankford", "@RonWyden", "@SenJeffMerkley", "@JeffMerkley", "@Bob_Casey", "@SenToomey", "@SenJackReed", "@SenWhitehouse", "@SheldonforRI" , "@LindseyGrahamSC", "@GrahamBlog", "@SenatorTimScott", "@votetimscott", "@SenJohnThune", "@johnthune", "@SenatorRounds", "@SenAlexander", "@SenBobCorker", "@BobCorker", "@JohnCornyn", "@SenTedCruz", "@tedcruz", "@OrrinHatch", "@SenMikeLee", "@SenatorLeahy", "@SenSanders", "@BernieSanders", "@MarkWarner", "@MarkWarnerVA", "@timkaine", "@PattyMurray", "@MurrayCampaign", "@SenatorCantwell", "@Sen_JoeManchin", "@JoeManchinWV", "@SenCapito", "@RonJohnsonWI", "@SenatorBaldwin", "@tammybaldwin", "@SenatorEnzi", "@SenJohnBarrasso")

Account_Type <- c("main", "main", "main", "campaign", "main", "main", "main", "personal", "main", "main", "main", "personal", "personal", "main", "main", "campaign", "personal", "main", "main", "main", "main", "campaign", "main", "main", "main", "main", "personal", "main", "campaign", "personal", "main", "main", "campaign", "main", "main", "main", "campaign", "main", "personal", "main", "campaign", "main", "main", "main", "main", "main", "Majority Leader", "main", "Office", "Office", "Main", "Main", "Main", "Main", "Main", "Main", "Main", "Main", "Main", "Main", "Main", "Campaign", "Main", "Main", "Personal", "Main", "Main", "Main", "Main", "Main", "Campaign", "Main", "Office", "Main", "Main", "Campaign", "Main", "Campaign", "Main", "Main", "Office", "Main", "Personal", "Main", "Main", "Main", "Main", "Main", "Personal", "Main", "Office", "Main", "Office", "Main", "Main", "Main", "Campaign", "Main", "Main", "Campaign", "Main", "Campaign", "Main", "Main", "Campaign", "Personal", "Office", "Main", "Campaign", "Main", "Main", "Main", "Main", "Campaign", "Campaign", "Main", "Main", "Main", "Campaign", "Main", "Personal", "Main", "Campaign", "Main", "Personal", "Main", "Main", "Main", "Personal", "Personal", "Main", "Personal", "Main", "Main", "Main", "Main", "Office", "Main", "Campaign", "Main", "Main", "Personal", "Main", "Main", "Campaign", "Main", "Main", "Main", "Campaign", "Main", "Main")

State <- c("Alabama", "Alabama", "Alaska", "Alaska", "Alaska", "Arizona", "Arizona", "Arkansas", "Arkansas", "Arkansas", "California", "California", "California", "California", "Colorado", "Colorado", "Connecticut", "Connecticut", "Delaware", "Delaware", "Delaware", "Florida", "Florida", "Georgia", "Georgia", "Georgia", "Georgia", "Hawaii", "Hawaii", "Hawaii", "Hawaii", "Idaho", "Idaho", "Illinois", "Illinois", "Illinois", "Illinois", "Indiana", "Indiana", "Indiana", "Indiana", "Iowa", "Iowa", "Kansas", "Kansas", "Kentucky", "Kentucky", "Kentucky", "Kentucky", "Louisiana", "Louisiana", "Louisiana", "Maine", "Maine", "Maine", "Maryland", "Maryland", "Maryland", "Massachusetts", "Massachusetts", "Massachusetts", "Massachusetts", "Michigan", "Michigan", "Michigan", "Minnesota", "Minnesota", "Minnesota", "Mississippi", "Mississippi", "Mississippi", "Missouri", "Missouri", "Missouri", "Montana", "Montana", "Montana", "Montana", "Nebraska", "Nebraska", "Nebraska", "Nevada", "Nevada", "Nevada", "Nevada", "New Hampshire", "New Hampshire", "New Hampshire", "New Hampshire", "New Jersey", "New Jersey", "New Jersey", "New Jersey", "New Mexico", "New Mexico", "New York", "New York", "New York", "North Carolina", "North Carolina", "North Carolina", "North Carolina", "North Dakota", "North Dakota", "North Dakota", "Ohio", "Ohio", "Ohio", "Ohio", "Oklahoma", "Oklahoma", "Oregon", "Oregon", "Oregon", "Pennsylvania", "Pennsylvania", "Rhode Island", "Rhode Island", "Rhode Island", "South Carolina", "South Carolina", "South Carolina", "South Carolina", "South Dakota", "South Dakota", "South Dakota", "Tennessee", "Tennessee", "Tennessee", "Texas", "Texas", "Texas", "Utah", "Utah", "Vermont", "Vermont", "Vermont", "Virginia", "Virginia", "Virginia", "Washington", "Washington", "Washington", "West Virginia", "West Virginia", "West Virginia", "Wisconsin", "Wisconsin", "Wisconsin", "Wyoming", "Wyoming")


handles_data <- as.data.frame(cbind(State, Senator, Handles))

#make sure everything is a character
handles_data$Handles <- as.character(handles_data$Handles)
handles_data$Account <- as.character(Account_Type)
#Subset for main accounts
handles_data_subset <- handles_data[handles_data$Account == 'main'|handles_data$Account=='Main',]


#twitter setup

#go to apps.twitter.com, and set up a new api. 
#under the access codes tab, you will find the four codes below. Copy and paste them and replace mine,

library(twitteR)
library(ROAuth)
library(httr)

#set API keys
#all these numbers come with the twitter app i created. I can explain that if anyone wants. 

api_key <- "xcxovsK0sWnTHNWiCVykzrnBk"

api_secret <- "TbWxcoTnDeuEzSm2cILuYe3PHsfHVwOPoB1n36FWUTtCdodn4e"

access_token <- "919955233882722304-pSVIo2KfeZ6Cl21S7FNZ4bEUdCZAXRr"

access_token_secret <- "vEpLLG1JHz5wPcJwHMsZslwpqlBkYnPFQWf2u9VlEjOdj"

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

#we can't control where the for loop will stop when twitter boots us.
#So we're doing them in chunks, one at a time. 
#Lizzie, you can start at 50, run the three lines of code below, and you'll get a vector of 5000 tweets.
#Copy and paste this code, changing all four 50's to 51, and run again, then do the same with 52
#Continue until it tells you something like "5000 tweets requested, but API could only produce ____)
#This means you've hit your limit for a while, and can try again later. 

library(plyr)


tweets_50 <- searchTwitter(handles_data_subset[50], n=5000)
tweets_50 <- laply(tweets_50, function(t)
  t$getText())

#Now we have to save it as a datafile so we don't have to rerun the code to get it again.
#name the dataframe tweets_50thru (whatever number you get through)
#save the file as 50to(whatever number).Rda 
#Since the data might be too big, we've been putting it on a flash drive. 
#Just make sure everyone knows which ones have been done so that we don't double pull. 
#since the handles got weird because of the main classification, there's 102.
#We've done I think 1-37

tweets_50thu60 <- as.data.frame(cbind(tweets_50, tweets_51,......))

save(tweets_50thru60, '50to60.Rda')



