import InteractiveFictionFramework

public struct bear {
    public var damage:Int = 5
    public var health :Int = 150
    public var isAlive: Bool? = false

   func getHealth() -> Int {
        return self.health
    }

    func attack() -> Int {
        let a:Int
        a = .random(in: 0...10)
        if((a == 1) || (a == 4) || (a == 7)) {
            print("The bear missed his attack !")
            return 0
        } else {
            return self.damage
        }

}
}
public struct zMonster {
    public var damage :Int =  6
    public var health : Int = 200
    public var isAlive:Bool? = true

      func attack() -> Int {
        let a:Int
        a = .random(in: 1...10)
        if((a == 1) || (a == 4) || (a == 7)) {
            print("The zMonster missed his attack !")
            return 0
        } else {
            return self.damage
        }

       }
    }