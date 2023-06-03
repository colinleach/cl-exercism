(ns log-levels
  (:require [clojure.string :as str]))

(defn get-bits
  [s]
  (str/split s #": ")
)

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (str/trim (last (get-bits s)))
)

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (def loglevel
    (str/lower-case (first (get-bits s))))
  (subs loglevel 1 (- (.length loglevel) 1))
)
;
(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (str (message s) " (" (log-level s) ")")
  )
