module API.DeleteURL ( DeleteAPI
                     , deleteHandler
                     ) where

import API.Types ( DeleteURLRequestBody(..) )
import Data.Text ( Text )
import Servant ( JSON
               , PlainText
               , ReqBody
               , type (:>)
               , Delete
               , Handler )

type DeleteAPI = "deleteURL" :> ReqBody '[JSON] DeleteURLRequestBody
                             :> Delete '[PlainText] Text

deleteHandler :: DeleteURLRequestBody -> Handler Text
deleteHandler DeleteURLRequestBody{..} = return "Successful deleteURL request!"