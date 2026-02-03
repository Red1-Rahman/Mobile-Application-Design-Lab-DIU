public class TestPolymorphism {
    public static void main(String[] args) {
        Animal dog = new Dog();
        Animal cat = new Cat();
        Animal cow = new Cow();

        Animal[] animals = {dog, cat, cow};
        for (Animal a : animals) {
            System.out.println(a.sound());
        }
    }
}
