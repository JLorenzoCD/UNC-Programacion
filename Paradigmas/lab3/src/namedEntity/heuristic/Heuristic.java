package namedEntity.heuristic;

import java.io.Serializable;
import java.util.Map;

public abstract class Heuristic implements Serializable {

	private static Map<String, String> categoryMap = Map.ofEntries(
			// Name
			Map.entry("Merge", "Name"),
			Map.entry("Elon", "Name"),
			Map.entry("Jeff", "Name"),
			Map.entry("Bill", "Name"),
			Map.entry("Steve", "Name"),
			Map.entry("Mark", "Name"),
			Map.entry("Joe", "Name"),
			Map.entry("Vladimir", "Name"),
			Map.entry("Angela", "Name"),
			Map.entry("Emma", "Name"),
			Map.entry("John", "Name"),
			Map.entry("Alice", "Name"),
			Map.entry("Bob", "Name"),
			Map.entry("Charlie", "Name"),
			Map.entry("David", "Name"),
			Map.entry("Eve", "Name"),
			Map.entry("Frank", "Name"),
			Map.entry("Grace", "Name"),
			Map.entry("Hannah", "Name"),
			Map.entry("Isaac", "Name"),
			Map.entry("Jack", "Name"),
			Map.entry("Karen", "Name"),
			Map.entry("Louis", "Name"),
			Map.entry("Mona", "Name"),
			Map.entry("Nina", "Name"),
			Map.entry("Oscar", "Name"),
			Map.entry("Paul", "Name"),
			Map.entry("Quincy", "Name"),
			Map.entry("Rachel", "Name"),
			Map.entry("Sam", "Name"),
			Map.entry("Tina", "Name"),
			Map.entry("Ursula", "Name"),
			Map.entry("Victor", "Name"),
			Map.entry("Wendy", "Name"),
			Map.entry("Xander", "Name"),
			Map.entry("Yara", "Name"),
			Map.entry("Zane", "Name"),

			// LastName
			Map.entry("Musk", "LastName"),
			Map.entry("Musk’s", "LastName"),
			Map.entry("Trump", "LastName"),
			Map.entry("Trump’s", "LastName"),
			Map.entry("Bezos", "LastName"),
			Map.entry("Gates", "LastName"),
			Map.entry("Jobs", "LastName"),
			Map.entry("Zuckerberg", "LastName"),
			Map.entry("Biden", "LastName"),
			Map.entry("Putin", "LastName"),
			Map.entry("Merkel", "LastName"),
			Map.entry("Stone", "LastName"),
			Map.entry("Doe", "LastName"),
			Map.entry("Smith", "LastName"),
			Map.entry("Johnson", "LastName"),
			Map.entry("Williams", "LastName"),
			Map.entry("Brown", "LastName"),
			Map.entry("Jones", "LastName"),
			Map.entry("Garcia", "LastName"),
			Map.entry("Martinez", "LastName"),
			Map.entry("Hernandez", "LastName"),
			Map.entry("Lopez", "LastName"),
			Map.entry("Gonzalez", "LastName"),
			Map.entry("Perez", "LastName"),
			Map.entry("Wilson", "LastName"),
			Map.entry("Anderson", "LastName"),
			Map.entry("Thomas", "LastName"),
			Map.entry("Taylor", "LastName"),
			Map.entry("Moore", "LastName"),
			Map.entry("Jackson", "LastName"),
			Map.entry("Martin", "LastName"),
			Map.entry("Lee", "LastName"),
			Map.entry("Thompson", "LastName"),
			Map.entry("White", "LastName"),
			Map.entry("Messi", "LastName"),

			// Title
			Map.entry("president", "Title"),
			Map.entry("ceo", "Title"),
			Map.entry("CEO", "Title"),
			Map.entry("cfo", "Title"),
			Map.entry("cto", "Title"),
			Map.entry("prime minister", "Title"),
			Map.entry("engineer", "Title"),
			Map.entry("doctor", "Title"),
			Map.entry("professor", "Title"),
			Map.entry("chairman", "Title"),
			Map.entry("director", "Title"),
			Map.entry("manager", "Title"),
			Map.entry("supervisor", "Title"),
			Map.entry("assistant", "Title"),
			Map.entry("analyst", "Title"),
			Map.entry("consultant", "Title"),
			Map.entry("developer", "Title"),
			Map.entry("designer", "Title"),
			Map.entry("architect", "Title"),
			Map.entry("scientist", "Title"),
			Map.entry("researcher", "Title"),
			Map.entry("writer", "Title"),
			Map.entry("editor", "Title"),
			Map.entry("journalist", "Title"),
			Map.entry("photographer", "Title"),
			Map.entry("artist", "Title"),
			Map.entry("musician", "Title"),
			Map.entry("actor", "Title"),
			Map.entry("actress", "Title"),
			Map.entry("President", "Title"),

			// City
			Map.entry("New York", "City"),
			Map.entry("London", "City"),
			Map.entry("Paris", "City"),
			Map.entry("Berlin", "City"),
			Map.entry("Colorado", "City"),
			Map.entry("Tokyo", "City"),
			Map.entry("Beijing", "City"),
			Map.entry("Washington", "City"),
			Map.entry("Delhi", "City"),
			Map.entry("Dubai", "City"),
			Map.entry("Toronto", "City"),
			Map.entry("San Francisco", "City"),
			Map.entry("Hollywood", "City"),

			// Country
			Map.entry("Arabia", "Country"),
			Map.entry("Argetina", "Country"),
			Map.entry("Korea", "Country"),
			Map.entry("USA", "Country"),
			Map.entry("Germany", "Country"),
			Map.entry("France", "Country"),
			Map.entry("UK", "Country"),
			Map.entry("Russia", "Country"),
			Map.entry("India", "Country"),
			Map.entry("China", "Country"),
			Map.entry("Brazil", "Country"),
			Map.entry("Canada", "Country"),
			Map.entry("Australia", "Country"),

			// Direction
			Map.entry("north", "Direction"),
			Map.entry("south", "Direction"),
			Map.entry("east", "Direction"),
			Map.entry("west", "Direction"),
			Map.entry("North", "Direction"),
			Map.entry("South", "Direction"),
			Map.entry("East", "Direction"),
			Map.entry("West", "Direction"),
			Map.entry("northeast", "Direction"),
			Map.entry("northwest", "Direction"),
			Map.entry("southeast", "Direction"),
			Map.entry("southwest", "Direction"),

			// Otherplace
			Map.entry("College", "Otherplace"),
			Map.entry("headquarters", "Otherplace"),
			Map.entry("embassy", "Otherplace"),
			Map.entry("border", "Otherplace"),
			Map.entry("airport", "Otherplace"),
			Map.entry("harbor", "Otherplace"),
			Map.entry("park", "Otherplace"),
			Map.entry("stadium", "Otherplace"),
			Map.entry("Congress", "Otherplace"),

			// Company
			Map.entry("Microsoft", "Company"),
			Map.entry("Apple", "Company"),
			Map.entry("Ford", "Company"),
			Map.entry("Google", "Company"),
			Map.entry("Meta", "Company"),
			Map.entry("Amazon", "Company"),
			Map.entry("Tesla", "Company"),
			Map.entry("Netflix", "Company"),
			Map.entry("OpenAI", "Company"),
			Map.entry("Nvidia", "Company"),
			Map.entry("Samsung", "Company"),
			Map.entry("Jamieson", "Company"),

			// Product
			Map.entry("YouTube", "Product"),
			Map.entry("iPhone", "Product"),
			Map.entry("Windows", "Product"),
			Map.entry("Android", "Product"),
			Map.entry("MacBook", "Product"),
			Map.entry("Podcasts", "Product"),
			Map.entry("ChatGPT", "Product"),
			Map.entry("PlayStation", "Product"),
			Map.entry("Xbox", "Product"),
			Map.entry("Alexa", "Product"),
			Map.entry("Tesla Model 3", "Product"),
			Map.entry("Surface Pro", "Product"),

			// Date
			Map.entry("2020", "Date"),
			Map.entry("2021", "Date"),
			Map.entry("2022", "Date"),
			Map.entry("2023", "Date"),
			Map.entry("2024", "Date"),
			Map.entry("january", "Date"),
			Map.entry("february", "Date"),
			Map.entry("march", "Date"),
			Map.entry("april", "Date"),
			Map.entry("may", "Date"),

			// Event
			Map.entry("World Cup", "Event"),
			Map.entry("Olympics", "Event"),
			Map.entry("G20", "Event"),
			Map.entry("CES", "Event"),
			Map.entry("WWDC", "Event"),
			Map.entry("F8", "Event"),
			Map.entry("UN Summit", "Event"),
			Map.entry("elections", "Event"),
			Map.entry("black friday", "Event"),
			Map.entry("cyber monday", "Event"),

			// Other
			Map.entry("economy", "Other"),
			Map.entry("technology", "Other"),
			Map.entry("politics", "Other"),
			Map.entry("innovation", "Other"),
			Map.entry("security", "Other"),
			Map.entry("health", "Other"),
			Map.entry("climate", "Other"),
			Map.entry("energy", "Other"),
			Map.entry("finance", "Other"),
			Map.entry("transport", "Other"));

	public String getCategory(String entity) {
		return categoryMap.get(entity);
	}

	public abstract boolean isEntity(String word);

}
