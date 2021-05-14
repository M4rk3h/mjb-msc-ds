#%%

# install modules
import tweepy, json

# set auth - bad practice
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
twitter_jsonFile = open("kekker.csv", "w")

class myStreamListener(tweepy.StreamListener):
        def on_connect(self):
            # Called initially to connect to the Streaming API
            print("You are now connected to the streaming API.")
        
        def __init__(self, api=None):
            super(myStreamListener, self).__init__()
        
        def on_error(self, status_code):
            # On error - if an error occurs, display the error / status code
            print('An Error has occured: ' + repr(status_code))
            return False   

        def on_data(self, data):
            try:
                # Decode the JSON from Twitter
                datajson = json.loads(data)
                # created_at, [user][name], text, entities, user_mentions, [user][location]
                myData = [datajson['created_at'], '\n', datajson['user']['name'], '\n', datajson['text'], '\n', datajson['user']['location'] ]
                print(myData)
                #insert/append the data into a json file
                # json.dump(datajson, twitter_jsonFile, indent = 4)
                json.dump(myData, twitter_jsonFile)
                return True
            except BaseException as e:
                print("Error myData %s" % str(e))
            return True
            

def streamTweets():
    # try timer here.
    # import datetime
    from datetime import datetime, timedelta
    # get todays date/time
    start = datetime.now()
    print('START ~~ ',start)

    # start loop
    while datetime.now() < start + timedelta(seconds=1):
        try:
            # locations
            loCal = [-3.576205, 51.466683, -3.143618, 51.825436] # uk
            #
            # languages
            lanG = ['en']
            # hashtags
            hashT = ['#COVID19', '#CoronaVirus', '#UnitedKingdom', '#UK', '#India']
            listener = myStreamListener(api = tweepy.API(wait_on_rate_limit = True)) 
            streamer = tweepy.Stream(auth=auth, listener = listener)
            print("Tracking location " + str('United Kingdom'))
            streamer.filter(locations=loCal,
                            languages = lanG,
                            track = hashT)
        except KeyboardInterrupt:
            print("Stopped.")
            twitter_jsonFile.close()
        finally:
            print('Done.')
            twitter_jsonFile.close()

streamTweets()