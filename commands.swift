import InteractiveFictionFramework
// Going on different direction does not require an argument for a simplicity matter.
// Hence for each direction a command is attributed
public enum Commands : Command {
     case leave,collect,goEast,goWest,goNorth,goSouth,search,openBag,HelpCommand,eat,equipe,talkToChef,attack
    
     public func run(game:Game, arguments: [String]) {
        let command = self
        
        switch command {    
            
        case .leave:
        myConcreteGame.finished = true
        
        case .collect:
        if(myConcreteGame.find().contains(arguments[0]) == true ) { // If the element given as argument exist, add it
        myConcreteGame.character?.bag.append(arguments[0]) 
        print("Item collected.")
         if let index = myConcreteGame.find().firstIndex(of: arguments[0]) {
        myConcreteGame.removeItemAt(index: index)} // We delete it
        } else {
            print("No such item exist")
        }

        case .goEast:
        
         myConcreteGame.forEast.popBear()  // Every time you travel in a direction, there is a chance a bear appear
        if(myConcreteGame.currentRoom.nextRoom(direction:.East) != nil) {
            myConcreteGame.character?.energy -= 5
            myConcreteGame.currentRoom = myConcreteGame.currentRoom.nextRoom(direction:.East)! // "Forced unwraped" ?
        } else {
            print("There is nothing in that direction")
        }

        case .goWest:
         myConcreteGame.forEast.popBear()
        if( myConcreteGame.currentRoom.nextRoom(direction:.West) != nil) {
            myConcreteGame.character?.energy -= 5
            myConcreteGame.currentRoom = myConcreteGame.currentRoom.nextRoom(direction:.West)! // "Forced unwraped" ?
        } else {
            print("There is nothing in that direction")
        }

        case .goNorth:
         myConcreteGame.forEast.popBear()    
        if( myConcreteGame.currentRoom.nextRoom(direction:.North) != nil) { // First check if there is a north
             if(myConcreteGame.currentRoom === myConcreteGame.bea && (myConcreteGame.character?.bag.contains("boat")  == true)) { // Check if the current room is a Beach and if the player has a boat
            myConcreteGame.currentRoom = myConcreteGame.currentRoom.nextRoom(direction:.North)!
            myConcreteGame.character?.energy -= 5
            if(myConcreteGame.oce.npc?.isAlive == true) { // If the monster has not been killed, we print that he appears
              print("You got in the Oean ! But wait, there is a huge monster that prevent you from reaching the city.. Kill it to go")
            }
            break
        } else if(myConcreteGame.currentRoom === myConcreteGame.bea) {
             print("You need a Boat to go on the ocean")
                break
         }
         if(myConcreteGame.currentRoom === myConcreteGame.oce && myConcreteGame.oce.npc?.isAlive == true) { // Check if the monster is still alive
             print("\nYou need to kill the zMonster first !")
             break
         }
            myConcreteGame.currentRoom = myConcreteGame.currentRoom.nextRoom(direction:.North)!
            myConcreteGame.character?.energy -= 5 // "Forced unwraped" ?
        } else {
            print("There is nothing in that direction")
        }
      
        
        case .goSouth:
         myConcreteGame.forEast.popBear()
         if( myConcreteGame.currentRoom.nextRoom(direction:.South) != nil) {
             myConcreteGame.character?.energy -= 5
            myConcreteGame.currentRoom = myConcreteGame.currentRoom.nextRoom(direction:.South)! // "Forced unwraped" ?
        } else {
            print("There is nothing in that direction")
        }

        case .search:
        if(myConcreteGame.currentRoom !== myConcreteGame.oce ) {
        myConcreteGame.character?.energy -= 5
          myConcreteGame.showItems() 
          break
        } else if(arguments[0] == "easter") {
            dump(myConcreteGame.oce.items)
        } 
          break// Run a function in the game isntance that show all items in the current room, but it has a cost
            

         case .openBag:
         dump(myConcreteGame.character?.bag)
         
         case .HelpCommand:
         print("\nBe careful : Every time you go to another room, you loose 10 energy. Once that either your health or your energy is empty, you lost")
         print("\nAvailable commands: \(game.controller.commands.keys.joined(separator: " | "))")

         
         case .eat:
         if(myConcreteGame.character?.bag.contains(arguments[0]) == true && (arguments[0] == "muschrooms" || arguments[0] == "apple" )) {
            myConcreteGame.character?.eat(argument:arguments[0]) // The player eat
             if let index = myConcreteGame.character?.bag.firstIndex(of: arguments[0]) { // delete from the bag
            myConcreteGame.character?.bag.remove(at: index)} 
         } else {
             print("No such item in your bag or item not etible")
         }

         case .equipe:
         if(myConcreteGame.character?.bag.contains("stick") == true) { // If there is a stick in the bag
         if let index = myConcreteGame.character?.bag.firstIndex(of: arguments[0]) { // delete from the bag
            myConcreteGame.character?.bag.remove(at: index)
            myConcreteGame.character?.damage += 2
         } else {
             print("No stick available in the bag")
           }
         }

         case .talkToChef:
         if(myConcreteGame.currentRoom === myConcreteGame.vill) { // If the current room is the village, he can talk to the chef
             myConcreteGame.vill.chefVillage.talk()
         } else {
             print("There is no one to talk with")
         }

         case .attack:
         if(myConcreteGame.currentRoom === myConcreteGame.forEast && ((myConcreteGame.forEast.npc?.isAlive) == true)) {// If the enemy is the bear
          myConcreteGame.playerAttackBear()
         } else if(myConcreteGame.currentRoom === myConcreteGame.oce) { // If the enemy is the zMonster
         myConcreteGame.playerAttackzMonster()
         } else {
             print("no one to attack")
         }

      }
    } 
}