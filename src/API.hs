module API ( app ) where
  
import Servant ( type (:<|>)(..)
               , Proxy(Proxy)
               , serve
               , Server
               , Application 
               )
import API.CreateURL ( CreateAPI
                     , createHandler 
                     )
import API.DeleteURL ( DeleteAPI
                     , deleteHandler 
                     )
import API.Redirect ( RedirectAPI
                    , redirectHandler 
                    )


{- API specification

-- The createURL endpoint expects a PUT request with the following string parameters:
createURL ( api_dev_key
          , original_url
          , custom_alias=None
          , user_name=None
          , expire_date=None
          )

Parameters:

api_dev_key (string): The API developer key of a registered account.
This will be used to, among other things, throttle users based on their allocated quota.

original_url (string): Original URL to be shortened.

custom_alias (string): Optional custom key for the URL.

user_name (string): Optional user name to be used in encoding.

expire_date (string): Optional expiration date for the shortened URL.

Returns: (string)

A successful insertion returns the shortened URL; otherwise, it returns a client/server error response.

-- The deleteURL endpoint expects a DELETE request with the following string parameters:
deleteURL ( api_dev_key 
          , url_key
          )

Parameters:

url_key (string): Represents the shortened URL to be retrieved. 
A successful deletion returns ‘URL Removed’; otherwise, it returns a client/server error response.

A successful GET request with the shortened URL key will return a redirection message with the
associated URL as the request body of the redirection; otherwise, it returns a client/server error response.
-}

type API = CreateAPI :<|> DeleteAPI :<|> RedirectAPI

server :: Server API
server = createHandler :<|> deleteHandler :<|> redirectHandler

app :: Application
app = serve (Proxy @API) server