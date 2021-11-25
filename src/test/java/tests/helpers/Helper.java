package tests.helpers;

import com.github.javafaker.Faker;

public class Helper {

    static Faker faker = new Faker();

    public static String email(){
        return faker.internet().emailAddress();
    }
    public static String id() {
        return String.valueOf(faker.number().randomDigit());
    }
    public static String userName() {
        return faker.name().username();
    }
    public static String firstName() {
        return faker.name().firstName();
    }
    public static String lastName() {
        return faker.name().lastName();
    }
    public static String phone() {
        return faker.phoneNumber().cellPhone();
    }
    public static String password() {
        return faker.code().asin();
    }
    public static int userStatus() {
        return faker.number().numberBetween(1,10);
    }

}
