import '../styles/global.css'
import '../pages/index.js'
import React, { useEffect } from "react"

function MyApp({ Component, pageProps }) {
  useEffect(() => {
    document.getElementById("__next");
  }, []);

  return <Component {...pageProps} />
}

export default MyApp