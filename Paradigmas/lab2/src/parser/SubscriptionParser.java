package parser;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Arrays;

import org.json.JSONTokener;
import org.json.JSONArray;
import org.json.JSONObject;

import subscription.SingleSubscription;
import subscription.Subscription;
/*
* Esta clase implementa el parser del  archivo de suscripción (json)
* Leer https://www.w3docs.com/snippets/java/how-to-parse-json-in-java.html
* */

public class SubscriptionParser {
    static private String[] validsUrlType = { "reddit", "rss" };

    static public Subscription parser() throws Exception {
        FileReader reader;
        try {
            reader = new FileReader("config/subscriptions.json");
        } catch (FileNotFoundException e) {
            // ! Ver que onda con este caso
            throw e;
        }
        JSONArray subsArr = new JSONArray(new JSONTokener(reader));

        Subscription subscription = new Subscription(null);
        for (int i = 0; i < subsArr.length(); i++) {
            JSONObject sub = subsArr.getJSONObject(i);

            String url = sub.getString("url");
            String urlType = sub.getString("urlType");
            String download = sub.getString("download");
            String[] urlParams = getUrlParams(sub.getJSONArray("urlParams"));

            SingleSubscription singleSubscription = createParserObject(url, urlType, download, urlParams);

            subscription.addSingleSubscription(singleSubscription);
        }

        return subscription;
    }

    static private String[] getUrlParams(JSONArray jsonUrlParams) {
        String[] urlParams = new String[jsonUrlParams.length()];
        for (int j = 0; j < jsonUrlParams.length(); j++) {
            urlParams[j] = jsonUrlParams.getString(j);
        }

        return urlParams;
    }

    static private SingleSubscription createParserObject(String url, String urlType, String download,
            String[] urlParams)
            throws Exception {

        if (!Arrays.asList(validsUrlType).contains(urlType)) {
            throw new Exception("El valor del campo 'urlType' es invalido. Campo dado por el usuario: " + urlType);
        }
        // ! Se tiene que validar el resto de campos

        SingleSubscription singleSubscription = new SingleSubscription(url, null, urlType);

        return singleSubscription;
    }

}
