(ns leap)

(defn %% [a b]
  (zero? (mod a b)))

(def !%% (complement %%))

(defn leap-year? [year]
  (and (%% year 4)
       (or (!%% year 100)
           (%% year 400))))
