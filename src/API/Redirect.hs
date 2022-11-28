module API.Redirect ( RedirectAPI
                    , redirectHandler 
                    ) where

import Data.Text ( Text, pack )
import DB.DB ( getDBConnection, getURL )
import Control.Monad.Cont ( MonadIO(liftIO) )
import Database.PostgreSQL.Simple ( query_ )
import Database.PostgreSQL.Simple.Types ( Only (fromOnly) )
import API.Types ( RedirectRequestBody )
import Servant ( Capture
               , PlainText
               , type (:>)
               , Get
               , Handler )

type RedirectAPI =    Capture RedirectRequestBody Text
                   :> Get '[PlainText] Text

redirectHandler :: Text -> Handler Text
redirectHandler shortURL = do
  dbConnection <- liftIO getDBConnection
  res          <- liftIO $ getURL dbConnection shortURL
  return $ "SUCCESSFUL DB QUERY: " <> (pack . show) res