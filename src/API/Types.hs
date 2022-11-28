module API.Types ( CreateURLRequestBody (..)
                 , DeleteURLRequestBody (..)
                 , RedirectRequestBody
                 ) where

import GHC.Generics ( Generic )
import Data.Aeson ( ToJSON
                  , FromJSON )
import Data.Text ( Text )

-- CreateURL types

data CreateURLRequestBody = CreateURLRequestBody {
    cURL'api_dev_key  :: Text
  , cURL'original_url :: Text
  , cURL'custom_alias :: Maybe Text
  , cURL'user_name    :: Text
  , cURL'expire_date  :: Text
  } 
  deriving (Show, Eq, Generic)

instance ToJSON CreateURLRequestBody
instance FromJSON CreateURLRequestBody

-- DeleteURL types

data DeleteURLRequestBody = DeleteURLRequestBody {
    dURL'api_dev_key :: Text
  , dURL'url_key     :: Text
  } 
  deriving (Show, Eq, Generic)

instance ToJSON DeleteURLRequestBody
instance FromJSON DeleteURLRequestBody

-- Redirect types

type RedirectRequestBody = "ShortURL"