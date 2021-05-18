# install modules
import tweepy, json

# set credentials
consumer_key = 'MIHMXSF6BSF82sN0uDGtd8bYi'
consumer_secret = 'owWFAXDtMcM3n8T1IZHtr1vHGko4Yxahhok3aZlikSVcGSvSnD'
Bearer_Token = 'AAAAAAAAAAAAAAAAAAAAAGZjOwEAAAAAJW9ar4DF90t78ooZvnfx%2Be2G4UI%3DPKfu2lBi6aFxd3ZY5ebeWbUKJxgNqdIaSYTu83vZmURa3zai7d'
access_token = '755358007-SmsZPc1tU23ha4Jzdsa5gybKTYVgFrktUgGzyaqD'
access_token_secret = 'a0ggY6G6RFyF9ObImMNCMAQo0bqAzp5MfqJjOHcGj5rMM'

# set authentication
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

# open a file to append the streaming data
streamedTweets = open("streamed-tweets.csv", "w")
unfilteredTweets = open("unfiltered.csv", "w")

class myStreamListener(tweepy.StreamListener):
        def on_connect(self):
            # Called initially to connect to the Streaming API
            print("You are now connected to the streaming API.")
        
        def __init__(self, api=None):
            super(myStreamListener, self).__init__()
        
        def on_error(self, status_code):
            if status == 420:
            # Returning False on_data method in case rate limit occurs.
                return False
                print(status)
            # On error - if an error occurs, display the error / status code
            print('An Error has occured: ' + repr(status_code))
            return False   

        def on_data(self, data):
            # Get all data from twitter as datajson
            datajson = json.loads(data)
            # dump all the data to see what we can use
            json.dump(datajson, unfilteredTweets, indent = 6)

            # select what we want to keep
            createdAt = datajson['created_at']
            userName = datajson['user']['name']
            tweetText = datajson['text']
            userLoc = datajson['user']['location']
            hashTags = datajson['entities']['hashtags']
            userMentions = datajson['entities']['user_mentions']

            # get the data as a dictionary -
            Dictionary = {1:createdAt, 2:userName, 3:tweetText,
                          4:userLoc, 5:hashTags, 6:userMentions}
            # convert dict to json string
            json_string = json.dumps(Dictionary)
            # write this converted string to csv & JSON
            json.dump(json_string, streamedTweets)

def goGetTweets():
    # locations
    loCal = [-3.576205, 51.466683, -3.143618, 51.825436] # uk
    # languages
    lanG = ['en']
    # hashtags
    hashT = ['#COVID19', '#CoronaVirus', '#UnitedKingdom', '#UK', '#India']
    listener = myStreamListener(api = tweepy.API(wait_on_rate_limit = True)) 
    streamer = tweepy.Stream(auth=auth, listener = listener)
    streamer.filter(locations=loCal, languages = lanG, track = hashT)
    print("Tracking location " + str('United Kingdom'))
    streamer.filter(locations=loCal, languages = lanG, track = hashT)


from datetime import datetime, timedelta
# set start
start = datetime.now()
# set end
end = start + timedelta(seconds=5)

print('START @ ',start)


# start loop

while datetime.now() < end:
    goGetTweets()
else:
    finalTime = datetime.now()
    print(finalTime)
    print("time ran out.")
    twitter_jsonFile.close()
    twitterJSON.close()
    streamer.disconnect()