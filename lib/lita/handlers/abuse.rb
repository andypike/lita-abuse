module Lita
  module Handlers
    class Abuse < Handler
      FIRST = %w(
        LAZY
        STUPID
        INSECURE
        IDIOTIC
        SLIMY
        SLUTTY
        SMELLY
        POMPOUS
        COMMUNIST
        DICKNOSE
        PIE-EATING
        RACIST
        ELITIST
        WHITE TRASH
        DRUG-LOVING
        BUTTERFACE
        TONE DEAF
        UGLY
        CREEPY
      )

      SECOND = %w(
        DOUCHE
        ASS
        TURD
        RECTUM
        BUTT
        COCK
        SHIT
        CROTCH
        BITCH
        TURD
        PRICK
        SLUT
        TAINT
        FUCK
        DICK
        BONER
        SHART
        NUT
        SPHINCTER
      )

      THIRD = %w(
        PILOT
        CANOE
        CAPTAIN
        PIRATE
        HAMMER
        KNOB
        BOX
        JOCKEY
        NAZI
        WAFFLE
        GOBLIN
        BLOSSUM
        BISCUIT
        CLOWN
        SOCKET
        MONSTER
        HOUND
        DRAGON
        BALLOON
      )

      route(
        /^abuse\s+(.+)/i,
        :abuse,
        :command => true,
        :help    => {
          "abuse NAME" => "Will abuse NAME"
        }
      )

      def abuse(response)
        name   = response.matches.first.first
        name   = "<#{name}>" if name.start_with?("@")
        insult = "#{FIRST.sample} #{SECOND.sample} #{THIRD.sample}"

        response.reply("#{name} you are a #{insult}")
      end

      Lita.register_handler(self)
    end
  end
end
