import InteractiveFictionFramework

public struct chef {

    init() {
        
    }
    func talk() -> () {
      talk2()
       // Func run into the "talk" command to check what the chef needs and what you can get
      if((myConcreteGame.character?.bag.contains("bearHead") == true ) && (myConcreteGame.character?.bag.contains("wood") == true )) {
        print("Chef : 'You killed the bear ! Here is the boat you need to leave the island' ")
         if let index = myConcreteGame.character?.bag.firstIndex(of: "wood") { // Delete from the bag
            myConcreteGame.character?.bag.remove(at: index)
         }
         if let index = myConcreteGame.character?.bag.firstIndex(of: "bearHead") { // Delete from the bag
            myConcreteGame.character?.bag.remove(at: index)
         }
        myConcreteGame.character?.bag.append("boat")
      } else if(myConcreteGame.character?.bag.contains("wood") == true ) {
        print("Chef : 'Here is a stick for you !'")
        myConcreteGame.character?.bag.append("stick")
          if let index = myConcreteGame.character?.bag.firstIndex(of: "wood") { // Delete from the bag
            myConcreteGame.character?.bag.remove(at: index)
         }

      } else if((myConcreteGame.character?.bag.contains("wood") == false) && (myConcreteGame.character?.bag.contains("bearHead") == true ) ) { // If no wood
        print("Chef : 'You dont have the wood, go find me some wood if you want the boat'")
      } else if((myConcreteGame.character?.bag.contains("wood") == false) && (myConcreteGame.character?.bag.contains("bearHead") == false ) ) {
        print("Chef : 'If you want a boat find me : 1 x wood and 1 x bear head \nIf you want a stick bring me : 1 x wood '")
      }
    }


    func talk2() -> () {
      if(myConcreteGame.character?.bag.contains("zMonsterHead") == true && myConcreteGame.character?.bag.contains("chest") == true) {
        print("Chef : 'Wow you killed the zMonster !\n'Give me that chest i open it for you \n'")
        myConcreteGame.character?.bag.append("Diamon")
              if let index = myConcreteGame.character?.bag.firstIndex(of: "zMonsterHead") { // Delete from the bag
            myConcreteGame.character?.bag.remove(at: index)
         }
               if let index = myConcreteGame.character?.bag.firstIndex(of: "chest") { // Delete from the bag
            myConcreteGame.character?.bag.remove(at: index)
         }
        return
      }
    }
}
