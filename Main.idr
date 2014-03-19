module Main

openDisplay : String -> IO Ptr
openDisplay s = mkForeign (FFun "XOpenDisplay" [FString] FPtr) s

-- FIXME
rootWindow : Ptr -> Int -> IO Int
rootWindow = undefined



main : IO ()
main = do
  -- FIXME: ignore SIGPIPE and SIGCHLD
  dpy <- openDisplay ""
  let dflt = defaultScreen dpy
  rootw <- rootWindow dpy dflt
  args <- getArgs
  sync dpy False -- sync to ensure all outstanding errors are delivered
