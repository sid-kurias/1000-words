;;; 2000-words.el -- limit yourself to the most common words while writing
;;
;; Copyright (C) 2013  Alex Schroeder <alex@gnu.org>
;;
;; This program is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later
;; version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.
;;
;; You should have received a copy of the GNU General Public License along with
;; GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defvar 2000-most-frequent-words
  '("the" "of" "and" "to" "a" "in" "that" "is" "was" "he" "for" "it"
    "with" "as" "his" "on" "be" "at" "by" "i" "this" "had" "not" "are"
    "but" "from" "or" "have" "an" "they" "which" "one" "you" "were" "her"
    "all" "she" "there" "would" "their" "we" "him" "been" "has" "when"
    "who" "will" "more" "no" "if" "out" "so" "said" "what" "up" "its"
    "about" "into" "than" "them" "can" "only" "other" "new" "some" "time"
    "could" "these" "two" "may" "then" "do" "first" "any" "my" "now"
    "such" "like" "our" "over" "man" "me" "even" "most" "made" "after"
    "also" "did" "many" "before" "must" "through" "back" "years" "where"
    "much" "your" "way" "well" "down" "should" "because" "each" "just"
    "those" "people" "mr" "how" "too" "little" "us" "state" "good" "very"
    "make" "world" "still" "see" "own" "men" "work" "long" "here" "get"
    "both" "between" "life" "being" "under" "never" "day" "same" "another"
    "know" "year" "while" "last" "might" "great" "old" "off" "come"
    "since" "go" "against" "came" "right" "states" "used" "take" "three"
    "himself" "few" "house" "use" "during" "without" "again" "place"
    "american" "around" "however" "home" "small" "found" "mrs" "thought"
    "went" "say" "part" "once" "high" "general" "upon" "school" "every"
    "don't" "does" "got" "united" "left" "number" "course" "war" "until"
    "always" "away" "something" "fact" "water" "though" "less" "public"
    "put" "think" "almost" "hand" "enough" "far" "took" "head" "yet"
    "government" "system" "set" "better" "told" "nothing" "night" "end"
    "why" "didn't" "called" "eyes" "find" "going" "look" "asked" "later"
    "point" "knew" "city" "next" "program" "business" "give" "group"
    "toward" "days" "young" "let" "room" "president" "side" "social"
    "present" "given" "several" "order" "national" "second" "possible"
    "rather" "per" "face" "among" "form" "important" "often" "things"
    "looked" "early" "white" "john" "case" "become" "large" "need" "big"
    "four" "within" "felt" "children" "along" "saw" "best" "church" "ever"
    "least" "power" "development" "thing" "light" "seemed" "family"
    "interest" "want" "members" "others" "mind" "country" "area" "done"
    "turned" "although" "open" "god" "service" "problem" "certain" "kind"
    "different" "thus" "began" "door" "help" "means" "sense" "whole"
    "matter" "perhaps" "itself" "york" "it's" "times" "law" "human" "line"
    "above" "name" "example" "action" "company" "hands" "local" "show"
    "whether" "five" "history" "gave" "today" "either" "act" "feet"
    "across" "taken" "past" "quite" "anything" "seen" "having" "death"
    "week" "experience" "body" "word" "half" "really" "field" "am" "car"
    "words" "already" "themselves" "i'm" "information" "tell" "together"
    "college" "shall" "money" "period" "held" "keep" "sure" "real"
    "probably" "free" "seems" "political" "cannot" "behind" "miss"
    "question" "air" "office" "making" "brought" "whose" "special" "major"
    "heard" "problems" "federal" "became" "study" "ago" "moment"
    "available" "known" "result" "street" "economic" "boy" "position"
    "reason" "change" "south" "board" "individual" "job" "areas" "society"
    "west" "close" "turn" "love" "community" "true" "court" "force" "full"
    "cost" "seem" "wife" "future" "age" "wanted" "department" "voice"
    "center" "woman" "control" "common" "policy" "necessary" "following"
    "front" "sometimes" "six" "girl" "clear" "further" "land" "run"
    "students" "provide" "feel" "party" "able" "mother" "music"
    "education" "university" "child" "effect" "level" "stood" "military"
    "town" "short" "morning" "total" "outside" "rate" "figure" "class"
    "art" "century" "washington" "north" "usually" "plan" "leave"
    "therefore" "evidence" "top" "million" "sound" "black" "strong" "hard"
    "various" "says" "believe" "type" "value" "play" "surface" "soon"
    "mean" "near" "lines" "table" "peace" "modern" "tax" "road" "red"
    "book" "personal" "process" "situation" "minutes" "increase" "schools"
    "idea" "english" "alone" "women" "gone" "nor" "living" "months"
    "america" "started" "longer" "dr" "cut" "finally" "third" "secretary"
    "nature" "private" "section" "greater" "call" "fire" "expected"
    "needed" "that's" "kept" "ground" "view" "values" "everything"
    "pressure" "dark" "basis" "space" "east" "father" "required" "union"
    "spirit" "except" "complete" "wrote" "i'll" "moved" "support" "return"
    "conditions" "recent" "attention" "late" "particular" "nations" "hope"
    "live" "costs" "else" "brown" "taking" "couldn't" "hours" "person"
    "forces" "beyond" "report" "coming" "inside" "dead" "low" "stage"
    "material" "read" "instead" "lost" "st" "heart" "looking" "miles"
    "data" "added" "pay" "amount" "followed" "feeling" "single" "makes"
    "research" "including" "basic" "hundred" "move" "industry" "cold"
    "developed" "tried" "simply" "hold" "can't" "reached" "committee"
    "island" "defense" "equipment" "son" "actually" "shown" "religious"
    "ten" "river" "getting" "central" "beginning" "sort" "received"
    "doing" "terms" "trying" "friends" "rest" "medical" "care"
    "especially" "picture" "indeed" "administration" "fine" "subject"
    "higher" "difficult" "simple" "range" "building" "wall" "meeting"
    "walked" "cent" "floor" "foreign" "bring" "similar" "passed" "paper"
    "property" "natural" "final" "training" "county" "police" "congress"
    "international" "growth" "market" "wasn't" "talk" "start" "england"
    "written" "story" "hear" "suddenly" "issue" "needs" "answer" "hall"
    "likely" "working" "countries" "considered" "you're" "earth" "sat"
    "purpose" "hour" "labor" "results" "entire" "happened" "william"
    "cases" "meet" "stand" "difference" "production" "hair" "involved"
    "fall" "stock" "food" "earlier" "increased" "whom" "particularly"
    "boys" "paid" "sent" "effort" "knowledge" "letter" "club" "using"
    "below" "thinking" "yes" "christian" "girls" "blue" "ready" "bill"
    "color" "weeks" "points" "trade" "certainly" "ideas" "industrial"
    "square" "methods" "addition" "deal" "method" "bad" "due" "moral"
    "decided" "statement" "neither" "nearly" "directly" "showed"
    "throughout" "questions" "kennedy" "reading" "anyone" "try" "services"
    "according" "programs" "nation" "lay" "french" "size" "remember"
    "physical" "record" "member" "comes" "understand" "southern" "western"
    "population" "normal" "strength" "aid" "merely" "district" "volume"
    "concerned" "month" "appeared" "temperature" "trouble" "trial"
    "summer" "direction" "ran" "maybe" "e" "sales" "student" "list"
    "continued" "friend" "evening" "literature" "generally" "association"
    "provided" "led" "army" "met" "influence" "piece" "opened" "former"
    "science" "step" "changes" "chance" "husband" "hot" "series" "average"
    "works" "cause" "effective" "george" "planning" "degree" "systems"
    "wouldn't" "direct" "soviet" "stopped" "wrong" "lead" "myself"
    "theory" "ask" "worked" "freedom" "clearly" "movement" "ways" "forms"
    "press" "organization" "somewhat" "spring" "efforts" "consider"
    "meaning" "bed" "fear" "lot" "treatment" "beautiful" "note" "placed"
    "hotel" "truth" "game" "apparently" "groups" "he's" "plant" "carried"
    "easy" "wide" "farm" "i've" "respect" "man's" "herself" "numbers"
    "manner" "reaction" "immediately" "radio" "running" "approach"
    "recently" "larger" "lower" "feed" "charge" "couple" "daily" "eye"
    "performance" "middle" "oh" "march" "persons" "understanding" "arms"
    "opportunity" "blood" "additional" "technical" "served" "described"
    "stop" "progress" "steps" "test" "chief" "reported" "based" "main"
    "determined" "image" "decision" "window" "religion" "gun" "appear"
    "responsibility" "europe" "british" "character" "learned" "horse"
    "writing" "account" "ones" "fiscal" "serious" "activity" "types"
    "corner" "green" "length" "hit" "lived" "audience" "letters"
    "returned" "obtained" "nuclear" "specific" "forward" "straight"
    "activities" "slowly" "shot" "doubt" "seven" "justice" "moving"
    "latter" "plane" "quality" "design" "obviously" "operation" "plans"
    "choice" "poor" "staff" "function" "figures" "parts" "stay" "saying"
    "include" "born" "pattern" "gives" "whatever" "sun" "cars" "faith"
    "pool" "hospital" "mass" "wish" "lack" "completely" "heavy" "waiting"
    "speak" "ball" "standard" "extent" "visit" "democratic" "corps" "firm"
    "income" "ahead" "deep" "there's" "effects" "language" "principle"
    "none" "price" "designed" "indicated" "analysis" "distance" "expect"
    "established" "products" "growing" "importance" "continue" "serve"
    "determine" "cities" "elements" "leaders" "division" "pretty"
    "existence" "attitude" "stress" "afternoon" "limited" "hardly"
    "thomas" "agreement" "factors" "scene" "easily" "closed" "write"
    "reach" "applied" "health" "married" "suggested" "attack" "rhode"
    "interested" "station" "professional" "remained" "won't" "drive"
    "season" "despite" "unit" "current" "spent" "eight" "covered" "negro"
    "role" "played" "i'd" "date" "council" "race" "charles" "commission"
    "original" "mouth" "reasons" "studies" "exactly" "machine" "built"
    "teeth" "james" "relations" "rise" "demand" "prepared" "related"
    "rates" "news" "supply" "trees" "becomes" "director" "sunday" "bit"
    "raised" "events" "unless" "officer" "dropped" "playing" "standing"
    "doctor" "places" "walk" "energy" "talking" "meant" "clay" "actual"
    "sides" "facilities" "filled" "techniques" "june" "knows" "hadn't"
    "glass" "poet" "fight" "dollars" "gas" "concern" "caught" "share"
    "popular" "claim" "entered" "chicago" "happy" "bridge" "jazz"
    "institutions" "materials" "style" "he'd" "follow" "parents"
    "communist" "status" "included" "thousand" "christ" "isn't" "heat"
    "radiation" "cattle" "suppose" "primary" "accepted" "books" "sitting"
    "conference" "opinion" "usual" "churches" "film" "giving" "behavior"
    "considerable" "funds" "construction" "attempt" "changed" "proper"
    "successful" "marriage" "sea" "sir" "hell" "wait" "sign" "worth"
    "source" "highly" "park" "discussion" "everyone" "practice" "arm"
    "tradition" "shows" "someone" "authority" "older" "annual" "project"
    "americans" "lord" "success" "oil" "remain" "principal" "leadership"
    "jack" "foot" "obvious" "fell" "thin" "pieces" "management" "measure"
    "security" "base" "entirely" "civil" "frequently" "records"
    "structure" "dinner" "weight" "condition" "mike" "objective" "complex"
    "produced" "noted" "caused" "equal" "balance" "you'll" "purposes"
    "corporation" "dance" "kitchen" "failure" "pass" "goes" "names"
    "quickly" "workers" "regard" "officers" "published" "famous" "develop"
    "london" "clothes" "laws" "citizens" "announced" "carry" "cover"
    "moreover" "add" "greatest" "check" "enemy" "mary" "leaving" "key"
    "manager" "active" "break" "king" "bottom" "pain" "relationship"
    "sources" "poetry" "assistance" "operating" "battle" "companies"
    "fixed" "possibility" "product" "spoke" "units" "touch" "doesn't"
    "bright" "finished" "carefully" "facts" "previous" "takes" "allowed"
    "require" "build" "patient" "financial" "philosophy" "loss" "stations"
    "rose" "died" "scientific" "otherwise" "inches" "sight" "seeing"
    "distribution" "marked" "rules" "capital" "captain" "relatively"
    "classes" "variety" "stated" "shape" "german" "musical" "significant"
    "concept" "reports" "proposed" "begin" "post" "impossible" "affairs"
    "named" "team" "circumstances" "learn" "remains" "round" "strange"
    "catholic" "operations" "collection" "aware" "sex" "broad" "bar"
    "henry" "robert" "governor" "offered" "bank" "yesterday"
    "requirements" "capacity" "speed" "prevent" "regular" "appears"
    "houses" "mark" "opening" "spread" "winter" "ship" "slightly"
    "remembered" "interests" "produce" "subjects" "crisis" "youth"
    "presented" "interesting" "fresh" "train" "instance" "drink" "poems"
    "agreed" "campaign" "event" "forced" "nine" "essential" "immediate"
    "lives" "file" "provides" "watch" "opposite" "apartment" "created"
    "germany" "trip" "neck" "watched" "index" "cells" "term" "session"
    "offer" "fully" "teacher" "recognized" "providence" "explained"
    "indicate" "twenty" "lady" "russian" "features" "gray" "studied" "sam"
    "economy" "reduced" "maximum" "separate" "procedure" "atmosphere"
    "desire" "mentioned" "reality" "expression" "differences" "enter"
    "traditional" "mission" "favor" "looks" "secret" "fast" "picked"
    "coffee" "smaller" "edge" "tone" "beside" "literary" "election"
    "judge" "title" "permit" "fair" "address" "rights" "vocational" "laid"
    "response" "believed" "model" "solid" "writers" "follows" "editor"
    "anode" "receive" "quiet" "telephone" "hearing" "buildings" "formed"
    "watching" "memory" "presence" "difficulty" "region" "knife" "bottle"
    "fit" "official" "vote" "junior" "treated" "expressed" "planned" "dog"
    "virginia" "killed" "camp" "stayed" "nice" "murder" "removed" "rock"
    "turning" "upper" "jr" "personnel" "pointed" "november" "louis"
    "selected" "berlin" "claims" "increasing" "leader" "positive" "frame"
    "gain" "twice" "failed" "nobody" "send" "ability" "fourth" "inch"
    "interior" "chapter" "jewish" "store" "faculty" "standards" "france"
    "rich" "contrast" "nevertheless" "brief" "jones" "plus" "individuals"
    "rule" "powers" "advantage" "discovered" "pulled" "writer" "brother"
    "valley" "membership" "die" "observed" "wine" "fig" "items" "daughter"
    "texas" "platform" "allow" "ordinary" "faces" "accept" "master"
    "legal" "hill" "fighting" "resources" "increases" "assumed" "sharp"
    "everybody" "broke" "command" "evil" "village" "phase" "russia"
    "detail" "morgan" "somehow" "fields" "familiar" "boat" "april" "unity"
    "richard" "responsible" "factor" "chosen" "principles" "constant"
    "proved" "carrying" "horses" "mercer" "column" "wants" "forth"
    "beauty" "compared" "approximately" "historical" "smiled" "universe"
    "calls" "san" "educational" "teachers" "independent" "danger" "clean"
    "dogs" "waited" "rain" "song" "naturally" "rome" "box" "buy" "sweet"
    "shelter" "page" "drawn" "dust" "communism" "exchange" "sections"
    "walls" "aircraft" "independence" "revolution" "realize" "seek"
    "willing" "league" "connection" "politics" "liberal" "completed"
    "weather" "fashion" "ordered" "levels" "settled" "realized" "let's"
    "ancient" "china" "lips" "won" "policies" "actions" "monday"
    "directed" "leading" "paris" "frank" "statements" "projects"
    "starting" "initial" "application" "traffic" "stands" "signs"
    "families" "quick" "khrushchev" "largely" "drew" "animal" "beat"
    "characteristic" "excellent" "practical" "electric" "electronic"
    "pictures" "ought" "protection" "article" "appropriate" "fifty"
    "minimum" "dry" "emotional" "she'd" "jury" "career" "chairman" "aside"
    "asking" "estimated" "teaching" "reference" "saturday" "flow" "flat"
    "background" "sit" "dress" "occurred" "warm" "potential" "impact"
    "yourself" "legs" "you've" "wonder" "communication" "answered" "thick"
    "birth" "declared" "honor" "july" "significance" "score" "helped"
    "gross" "issues" "forest" "search" "block" "cutting" "jesus"
    "substantial" "gets" "relief" "plays" "ends" "arts" "besides" "cell"
    "intellectual" "properties" "experiments" "closely" "chair" "capable"
    "adequate" "measured" "ourselves" "fingers" "hanover" "attorney"
    "passing" "billion" "discussed" "achievement" "headquarters" "rapidly"
    "object" "escape" "jobs" "join" "phil" "california" "supposed"
    "they're" "typical" "wore" "employees" "newspaper" "desk" "one's"
    "imagination" "hung" "holding" "objects" "sleep" "dominant"
    "reasonable" "matters" "resolution" "site" "credit" "aspects"
    "message" "maintenance" "laos" "explain" "we'll" "located" "towards"
    "belief" "yards" "guests" "bodies" "primarily" "grew" "spiritual"
    "dream" "empty" "wind" "tom" "kill" "benefit" "signal" "tomorrow"
    "sufficient" "dramatic" "fellow" "happen" "contact" "unusual"
    "argument" "powerful" "narrow" "parker" "shop" "rifle" "highest"
    "broken" "competition" "domestic" "contemporary" "grow" "experiment"
    "assume" "relation" "location" "reduce" "homes" "portion" "officials"
    "senate" "fund" "rising" "speaking" "internal" "struggle" "agencies"
    "december" "equally" "sets" "please" "drove" "arrived" "save"
    "achieved" "soft" "assignment" "baby" "greatly" "appeal" "recognize"
    "wilson" "library" "careful" "pleasure" "cool" "extreme" "concerning"
    "governments" "procedures" "prices" "duty" "courses" "friendly"
    "we're" "coast" "la" "acting" "closer" "speech" "european" "showing"
    "boston" "victory" "beach" "minister" "commercial" "metal" "possibly"
    "tests" "kid" "vast" "artists" "continuing" "associated" "shoulder"
    "weapons" "shore" "greek" "travel" "imagine" "feelings"
    "organizations" "ideal" "eat" "friday" "keeping" "heavily" "armed"
    "ended" "learning" "text" "existing" "advance" "scale" "setting"
    "goal" "judgment" "task" "contract" "garden" "nose" "refused"
    "streets" "orchestra" "negroes" "contained" "machinery" "chemical"
    "onto" "circle" "slow" "maintain" "fat" "somewhere" "technique"
    "stared" "moon" "tuesday" "notice" "drop" "budget" "providing"
    "formula" "housing" "tension" "un" "repeated" "parties" "uses" "taste"
    "novel" "headed" "sensitive" "conclusion" "roof" "solution" "bible"
    "birds" "hole" "lie" "ultimate" "songs" "struck" "snow" "tree"
    "plants" "finds" "stories" "mine" "painting" "exist" "thirty" "sexual"
    "roads" "commerce" "dallas" "establish" "previously" "causes" "talked"
    "railroad" "critical" "remove" "emphasis" "grounds" "neighborhood"
    "surprised" "minor" "india" "understood" "soldiers" "perfect" "avoid"
    "hence" "leg" "busy" "occasion" "smile" "lewis" "stone" "roman"
    "unique" "animals" "sky" "safe" "etc" "orders" "fairly" "liked"
    "useful" "exercise" "lose" "culture" "pale" "wondered" "charged"
    "details" "informed" "permitted" "professor" "replied" "completion"
    "minute" "processes" "apart" "apparent" "bay" "truck" "majority"
    "afraid" "artist" "goods" "somebody" "appearance" "double" "baseball"
    "spot" "flowers" "notes" "enjoyed" "entrance" "uncle" "motion" "alive"
    "beneath" "combination" "truly" "congo" "becoming" "requires" "sample"
    "bear" "dictionary" "shook" "granted" "confidence" "agency" "joined"
    "apply" "vital" "september" "review" "wage" "motor" "fifteen"
    "regarded" "draw" "wheel" "organized" "vision" "wild" "palmer"
    "intensity" "bought" "represented" "entitled" "hat" "pure" "academic"
    "chinese" "minds" "guess" "loved" "spite" "evident" "executive"
    "conducted" "sought" "firms" "joe" "fort" "martin" "demands"
    "extended" "joseph" "cross" "win" "pick" "worry" "britain" "begins"
    "divided" "theme" "percent" "rooms" "device" "conduct" "runs"
    "improved" "games" "cultural" "plenty" "mile" "components")
  "Words listed by frequency: the first 2000 most frequent words
from the Brown Corpus (1,015,945 words). Taken from this website:
http://www.edict.biz/lexiconindex/frequencylists/words2000.htm")

;; (defvar 1000-words-regexp
;;   (regexp-opt
;;    (cl-loop for i from 0 to 999
;; 	    collect (nth i 2000-most-frequent-words))
;;    'words)
;;   "Regular expression matching the 1000 most frequent words
;; based on `2000-most-frequent-words'.")

(defvar 2000-words-regexp
  (regexp-opt
   (cl-loop for i from 0 to 1999
	    collect (nth i 2000-most-frequent-words))
   'words)
  "Regular expression matching the second thousand most frequent words
based on `2000-most-frequent-words'.")

;; (define-derived-mode 2000-words-mode org-mode "2000"
;;   "Major mode for writing text limited to the most common words.
;; The words used are in `2000-most-frequent-words'."
;;   (font-lock-add-keywords nil `((,1000-words-regexp . 'default)
;; 				(,2000-words-regexp . 'default)
;; 				("\\w+" . 'error)))
;;   (setq font-lock-keywords-case-fold-search t))

;; (define-derived-mode 1000-words-mode org-mode "1000"
;;   "Major mode for writing text limited to the most common words.
;; The words used are in `1000-most-frequent-words'."
;;   (font-lock-add-keywords nil `((,1000-words-regexp . 'default)
;; 				("\\w+" . 'error)))
;;   (setq font-lock-keywords-case-fold-search t))
(defface common-word-face
  `((((background  dark)) :foreground ,(color-lighten-name (face-foreground 'error) 40))
    (((background light)) :foreground ,(color-darken-name (face-foreground 'error) 40)))
  "Basic face for frequently used words"
  :group '2000-words)

;; (defface common-word-face
;;   `((t  ;;:weight light
;;      :foreground ,(color-saturate-name (face-foreground 'error) 10)))
;;   "Basic face for frequently used words"
;;   :group '2000-words)

(define-minor-mode 2000-words-mode
  "Sets up 2000 words mode"
  :global nil
  :group 'checks
  :lighter " CommonWords"
  :init-value nil
  (if 2000-words-mode (2000-words-setup) (2000-words-pulldown)))

(defun 2000-words-setup ()
  "Major mode for writing text limited to the most common words.
The words used are in `2000-most-frequent-words'."
  (font-lock-add-keywords nil `((,2000-words-regexp . 'default)
				("\\w+" . 'common-word-face)))
  (setq font-lock-keywords-case-fold-search t)
  (font-lock-fontify-buffer))
(defun 2000-words-pulldown ()
  "Major mode for writing text limited to the most common words.
The words used are in `2000-most-frequent-words'."
  (font-lock-add-keywords nil `((,2000-words-regexp . 'default)
				("\\w+" . 'default)))
  (setq font-lock-keywords-case-fold-search t)
  (font-lock-fontify-buffer))
(provide '2000-words)

;;; 2000-words.el ends here
