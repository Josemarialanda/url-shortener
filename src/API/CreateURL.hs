module API.CreateURL ( CreateAPI
                     , createHandler
                     ) where

import Data.Text ( Text, pack )
import DB.DB ( getDBConnection )
import Control.Monad.Cont ( MonadIO(liftIO) )
import Database.PostgreSQL.Simple ( query_ )
import Database.PostgreSQL.Simple.Types ( Only (fromOnly) )
import API.Types ( CreateURLRequestBody ( .. ) )
import Servant ( JSON
               , PlainText
               , ReqBody
               , type (:>)
               , Post 
               , Handler)

type CreateAPI = "createURL" :> ReqBody '[JSON] CreateURLRequestBody
                             :> Post '[PlainText] Text

createHandler :: CreateURLRequestBody -> Handler Text
createHandler CreateURLRequestBody{..} = do
  dbConnection <- liftIO getDBConnection
  res <- liftIO (query_ dbConnection "SELECT 1 + 1" :: IO [Only Int])
  return $ "SUCCESSFUL DB QUERY: " <> (pack . show) res