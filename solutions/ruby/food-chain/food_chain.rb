class FoodChain
    module Animals
        class Animal
            def verse = ([swallow] + preys).join("\n") + "\n"
            def prey_on = Animals::ANIMALS.filter{_1.order < self.order}
            def name = self.class.name.split('::').last.downcase
            def swallow = "I know an old lady who swallowed a #{name}.\n#{comment}"
            def preys
                prev = prey_on.last
                if prev
                    ["She swallowed the #{name} to catch the #{prev.name}#{prev.end}"] + prev.preys
                else
                    []
                end
            end
            def end = "."
        end

        class Fly < Animal
            def order = 0
            def comment = "I don't know why she swallowed the fly. Perhaps she'll die."
            def end = ".\n#{comment}"
        end
        class Spider < Animal
            def order = 1
            def comment = "It wriggled and jiggled and tickled inside her."
            def end = " that wriggled and jiggled and tickled inside her."
        end
        class Bird < Animal
            def order = 2
            def comment = "How absurd to swallow a bird!"
        end
        class Cat < Animal
            def order = 3
            def comment = "Imagine that, to swallow a cat!"
        end
        class Dog < Animal
            def order = 4
            def comment = "What a hog, to swallow a dog!"
        end
        class Goat < Animal
            def order = 5
            def comment = "Just opened her throat and swallowed a goat!"
        end
        class Cow < Animal
            def order = 6
            def comment = "I don't know how she swallowed a cow!"
        end
        class Horse < Animal
            def order = 7
            def comment = "She's dead, of course!"
            def prey_on = []
        end
        ANIMALS = Animal.subclasses.map(&:new).sort{_1.order}
    end

    def self.song
        Animals::ANIMALS.map(&:verse).join("\n")
    end
end