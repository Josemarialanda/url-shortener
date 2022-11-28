module DB.DB ( getDBConnection
             , getURL 
             ) where

import Data.Text ( Text )
import Database.PostgreSQL.Simple

localPG :: ConnectInfo
localPG = defaultConnectInfo { 
    connectUser = "josemaria"
  , connectDatabase = "db"
  -- connectHost = "localHost"
  -- connectPort  = 5432
  -- connectPassword = "1234"
  }

getDBConnection :: IO Connection
getDBConnection = connect localPG

getURL :: Connection -> Text -> IO [Only Text]
getURL connection shortURL = query connection "SELECT original_url FROM url_table WHERE short_url = ?" $ Only shortURL

