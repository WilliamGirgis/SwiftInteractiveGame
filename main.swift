import InteractiveFictionFramework
public class myGame : Game {

    var seconds = 10

    var character : character? // Refference to the character choosed by the player
    lazy var parser = Parser(controller: self.controller)
    var island : [Room]
    lazy public var controller = Controller(game:self)

    public var finished: Bool

    public var currentRoom: Room

        let forEast = forestEast(name:"Forest East")  
        let forWest = forestWest(name:"Forest West")
        let vill = village(name:"Village")
        let oce = ocean(name:"Ocean")
        let bea = beach(name:"Beach")
        let cit = city(name:"City") 

        init() {
        self.island = [forEast,forWest,vill,oce,bea,cit] // We store the rooms in the island
        self.finished = false
        self.character = nil
        self.currentRoom = island[0] // The game starts on the East side of the forest
        self.createIsland() // We set up the exits for rooms 
        self.registerCommands()
    }

      func createIsland() -> () { // Function called in the create of myGame to set up exits
        forEast.exits = [.West:forWest,.North:bea]
        forWest.exits  = [.North:vill,.East:forEast]
        oce.exits = [.North:cit]
        vill.exits = [.South:forWest,.East:bea]
        bea.exits = [.South:forEast,.North:oce,.West:vill]
    }

     func registerCommands() -> () { // Function to register all commands in the controller
        self.controller.register(keyword: "q", command: Commands.leave)
        self.controller.register(keyword: "right", command: Commands.goEast)
        self.controller.register(keyword: "left", command: Commands.goWest)
        self.controller.register(keyword: "up", command: Commands.goNorth)
        self.controller.register(keyword: "down", command: Commands.goSouth)
        self.controller.register(keyword: "loot",command:Commands.collect)
        self.controller.register(keyword: "search", command: Commands.search)
        self.controller.register(keyword: "bag", command: Commands.openBag)
        self.controller.register(keyword :"help",command:Commands.HelpCommand)
        self.controller.register(keyword: "eat", command: Commands.eat)
        self.controller.register(keyword: "equipe", command: Commands.equipe)
        self.controller.register(keyword: "talk", command: Commands.talkToChef)
        self.controller.register(keyword: "attack", command: Commands.attack)
    }


  func find() ->  [String] {// Describes contents of the current room
        if(self.currentRoom === forEast) {// Content of foresEast
             return  forEast.items
        }
         if(self.currentRoom === forWest) { // Content of forestWest
             return forWest.items 

        }
         if(self.currentRoom === bea) { // Content of beach
             return bea.items

        }
        if(self.currentRoom === oce) { // Content of ocean
            return oce.items

        }
        return ["No object found"]
        
    }
    func showItems() -> () { // Show elements
         if(self.currentRoom === forEast) { // Content of foresEast
         if(self.forEast.npc?.isAlive == true) {// Check if the bear is alive
           print("A bear is in there !")
         }
            dump(forEast.items)
        }
         if(self.currentRoom === forWest) { // Content of forestWest
        dump(forWest.items)
        }
         if(self.currentRoom === bea) { // Content of beach
         dump(bea.items)
        }
        if(self.currentRoom === vill) {
         print("There is someone to talk with ! enter 'talk'")
        }
    }
    
    func removeItemAt(index:Int) -> () { 
        /* Since find() is non-mutating, i am forced to create my own function to delete
        elements outside of the class boundaries*/
        if(self.currentRoom === forEast) {
          self.forEast.items.remove(at: index)
        }
        if(self.currentRoom === forWest) {
          self.forWest.items.remove(at: index)
        }
        if(self.currentRoom === bea) {
          self.bea.items.remove(at: index)
        }
        if(self.currentRoom === oce) {
          self.oce.items.remove(at: index)
        }  
    }

    func isLost() -> () { // Function executed each time a command requires energy or health
        if (self.character!.health <= 0 || self.character!.energy <= 0) {
          print("You lost ! \(self.character!.health) \(self.character!.energy)")
            self.finished = true
        } else if (self.currentRoom === cit && self.character?.bag.contains("Diamon") == true ) {
               print("You reached the city with the treasure, congratulation \(self.character?.name ?? "none") !!!")
             self.finished = true
        } else if(self.currentRoom === cit) { // If the room is the city, the game is finished
            print("You reached the city congratulation \(self.character?.name ?? "none") !!!")
             self.finished = true
        }
    }

    func playerAttackBear() -> () {// Special function to attack the bear
      let a:Int 
      var playerDmg:Int = 0
        a = .random(in: 0...9)
        if((a == 0) || (a == 4) || (a == 7)) {
            print("You missed your attack !")
            } else {
                playerDmg = self.character!.damage * a
            self.forEast.npc?.health -= playerDmg // The damage inflicted is always random, not playe's or npc's damae
        }
        let npcDmg = (self.forEast.npc?.attack())!  * a

         self.character?.health -= npcDmg
        print("\nYour new health: \(self.character?.health ?? 0) (-\(npcDmg))")
        print("NPC new Health: \(self.forEast.npc?.health ?? 0) (-\(playerDmg))\n")

        let x:Int = 0
        if(self.forEast.npc!.health <= x) {
            self.forEast.npc!.isAlive = false
            print("You killed the bear, collect the bear head and go to the chef")
            self.forEast.items.append("bearHead") // The bear drops his head
        }
    }

    func playerAttackzMonster() -> () {// Special function to attack the zMonster
      let a:Int
      var playerDmg:Int = 0
        a = .random(in: 0...9) // The damage inflicted by either the npc or the player, is depending on that variable
        if((a == 0) || (a == 4) || (a == 7)) {
            print("You missed your attack !")
            } else {
              playerDmg = self.character!.damage  * a
            self.oce.npc?.health -= playerDmg 
        }
        let npcDmg = (self.oce.npc?.attack())!  * a
        self.character?.health -= npcDmg
        print("\nYour new health: \(self.character?.health ?? 0) (-\(npcDmg))")
        print("NPC new Health: \(self.oce.npc?.health ?? 0) (-\(playerDmg))\n")

        let x:Int = 0
        if(self.oce.npc!.health <= x) {
            self.oce.npc!.isAlive = false
            print("You killed the zMonsterHead !! You are free to go to the city")
            self.oce.items.append("zMonsterHead")
            self.oce.exits = [.North:cit,.South:bea]
        }
    }

    func start() { // The main loop of the game
        while(!self.finished) {
            print("\(self.currentRoom), \n What to do now ? Energy = \(self.character?.energy ?? 0) Health = \(self.character?.health ?? 0) Force = \(self.character?.damage ?? 0)")
            do { 
           try parser.readCommand() 
           } catch ParserError.noInputGiven {
               print("No input given")
           } catch CommandError.commandNotFound(let keyword) {
               print("No command with that keyword : \(keyword)")
           } catch {
             print("ERROR")
           }
           self.isLost()
            }
        }
          func autoMode() -> () {

      // recursive loop
        }
    }

  var myConcreteGame = myGame() // Concrete game
   var choice:String?
   var name :String?


 print("You were on a flight, but it crashed. \nNow you have to find a boat to leave the island...")
    while(myConcreteGame.character == nil) {
     print("Choose a character: Scientist (enter 'S') or Hunter (enter 'H')")
     choice = readLine()
   if(choice == "S") {
       print("Enter the name for the character:")
       name = readLine()
       myConcreteGame.character = scientist(name:name ?? "None")
   } else if(choice == "H") {
       print("Enter the name for the character:")
       name = readLine()
       myConcreteGame.character = hunter(name:name ?? "None")
   } else if (choice == "Cheat911") {
     print("Enter the name for the character:")
    name = readLine()
     myConcreteGame.character = cop(name:name ?? "None")
     }
   
   } 
   // myConcreteGame.autoMode()
    myConcreteGame.start()




   



