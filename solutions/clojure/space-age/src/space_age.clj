(ns space-age)

(defn- with-rate [n]
  (fn [s]
    (with-precision 2 (/ (* s (/ 1 n)) 31557600))))

(def on-mercury (with-rate 0.2408467))

(def on-venus (with-rate 0.61519726))

(def on-earth (with-rate 1.0))

(def on-mars (with-rate 1.8808158))

(def on-jupiter (with-rate 11.862615))

(def on-saturn (with-rate 29.447498))

(def on-uranus (with-rate 84.016846))

(def on-neptune (with-rate 164.79132))
