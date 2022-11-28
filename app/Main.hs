import Network.Wai.Handler.Warp ( run )
import API ( app )


main :: IO ()
main = run 8081 app