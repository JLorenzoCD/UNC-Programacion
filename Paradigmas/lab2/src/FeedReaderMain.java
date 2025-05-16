import parser.GeneralParser;
import parser.SubscriptionParser;

import subscription.SingleSubscription;
import subscription.Subscription;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import feed.Article;
import feed.Feed;

import httpRequest.httpRequester;
import namedEntity.NamedEntity;
import namedEntity.NamedEntityFactory;
import namedEntity.heuristic.Heuristic;
import namedEntity.heuristic.QuickHeuristic;
import namedEntity.heuristic.RandomHeuristic;

public class FeedReaderMain {

	private enum HeuristicType {
		Quick,
		Random;

		public static Heuristic getHeuristic(HeuristicType htype) {
			if (htype.equals(HeuristicType.Quick)) {
				return new QuickHeuristic();
			} else {
				return new RandomHeuristic();
			}
		}
	}

	private static void printHelp() {
		System.out.println("Please, call this program in correct way: FeedReader [-ne]");
	}

	public static void main(String[] args) throws Exception {
		System.out.println("************* FeedReader version 1.0 *************");
		if (args.length == 0) {
			/*
			 * Se obtiene las suscripciones del usuario, los artículos de las mismas, y por
			 * ultimo, se muestran por terminal todos los artículos de forma agradable para
			 * el usuario
			 */

			// Leer el archivo de subscription por defecto;
			Subscription sub = SubscriptionParser.getSubscription();
			for (SingleSubscription singleSubscription : sub.getSubscriptionsList()) {

				for (int i = 0; i < singleSubscription.getUlrParamsSize(); i++) {
					// Se obtiene la urlFeed dado el indice de un urlParam
					String urlFeed = singleSubscription.getFeedToRequest(i);

					// Llamar al httpRequester para obtener el feed del servidor
					httpRequester req = new httpRequester(urlFeed);
					String res = req.getData(singleSubscription.getUrlType());

					// Llamar al Parser especifico para extraer los datos necesarios por la
					// aplicación
					GeneralParser parser = SubscriptionParser.getParser(singleSubscription.getUrlType());
					parser.parse(res);

					// Llamar al constructor de Feed
					Feed feed = parser.getFeed();

					// LLamar al prettyPrint del Feed para ver los artículos del feed en forma
					// legible y amigable para el usuario
					feed.prettyPrint();
				}

			}

		} else if (args.length == 1) {
			/*
			 * CONSIGNA
			 * Leer el archivo de suscription por defecto;
			 * Llamar al httpRequester para obtenr el feed del servidor
			 * Llamar al Parser especifico para extrar los datos necesarios por la
			 * aplicacion
			 * Llamar al constructor de Feed
			 * Llamar a la heuristica para que compute las entidades nombradas de cada
			 * articulos del feed
			 * LLamar al prettyPrint de la tabla de entidades nombradas del feed.
			 */

			/*
			 * Se obtiene las suscripciones del usuario, los artículos de las mismas,
			 * las entidades nombradas de los artículos y por ultimo, se muestran en la
			 * terminal en formato de tabla con sus ocurrencias.
			 */

			// Se revisa que el argumento sea el correcto
			if (!"-ne".equals(args[0])) {
				System.out.println("Argumento invalido.");
				printHelp();
				System.exit(1);
			}

			// Se selecciona una de las heruristicas para el programa
			Heuristic heuristic = HeuristicType.getHeuristic(HeuristicType.Quick);

			// Leer el archivo de subscription por defecto;
			Subscription sub = SubscriptionParser.getSubscription();
			for (SingleSubscription singleSubscription : sub.getSubscriptionsList()) {

				for (int i = 0; i < singleSubscription.getUlrParamsSize(); i++) {
					// Se obtiene la urlFeed dado el indice de un urlParam
					String urlFeed = singleSubscription.getFeedToRequest(i);

					// Llamar al httpRequester para obtener el feed del servidor
					httpRequester req = new httpRequester(urlFeed);
					String res = req.getData(singleSubscription.getUrlType());

					// Llamar al Parser especifico para extraer los datos necesarios por la
					// aplicación
					GeneralParser parser = SubscriptionParser.getParser(singleSubscription.getUrlType());
					parser.parse(res);

					// Llamar al constructor de Feed
					Feed feed = parser.getFeed();

					// Mapa para guardar de entidades del Feed
					Map<String, List<NamedEntity>> entityMap = new HashMap<>();
					NamedEntityFactory nef = new NamedEntityFactory();

					for (Article article : feed.getArticleList()) {
						// Llamar a la heuristica para que compute las entidades nombradas de cada
						// artículos del feed
						article.computeNamedEntities(heuristic);

						for (NamedEntity namedEntity : article.getNamedEntityList()) {
							String category = namedEntity.getCategory();
							String name = namedEntity.getName();
							int frequency = namedEntity.getFrequency();

							// Se crea la clase mediante un NamedEntityFactory
							NamedEntity newNe = nef.create(namedEntity);

							boolean isSaved = false;

							if (entityMap.get(category) == null) {
								entityMap.put(category, new ArrayList<NamedEntity>());
								entityMap.get(category).add(newNe);
								continue;
							}

							for (NamedEntity saveNamedEntity : entityMap.get(category)) {
								if (saveNamedEntity.getName().equals(name)) {
									saveNamedEntity.setFrequency(saveNamedEntity.getFrequency() + frequency);
									isSaved = true;
									break;
								}
							}

							if (!isSaved) {
								entityMap.get(category).add(newNe);
							}
						}

					}

					// LLamar al prettyPrint de la tabla de entidades nombradas del feed.
					// TODO

					// * Prueba
					for (Map.Entry<String, List<NamedEntity>> entry : entityMap.entrySet()) {
						for (NamedEntity ne : entry.getValue()) {
							System.out.println(ne);
						}
					}

				}

			}

		} else {
			printHelp();
		}
	}

}
