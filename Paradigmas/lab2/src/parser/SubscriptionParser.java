package parser;

import java.io.FileNotFoundException;
import java.io.FileReader;

import org.json.JSONTokener;
import org.json.JSONArray;
import org.json.JSONObject;
/*
 * Esta clase implementa el parser del  archivo de suscripcion (json)
 * Leer https://www.w3docs.com/snippets/java/how-to-parse-json-in-java.html
 * */

public class SubscriptionParser extends GeneralParser {
    public SubscriptionParser() throws Exception {
        // ! Ver que onda con esto
        super(null, null, null, null);
    }

    static public GeneralParser[] parser() throws Exception {
        FileReader reader;
        try {
            reader = new FileReader("config/subscriptions.json");
        } catch (FileNotFoundException e) {
            // ! Ver que onda con este caso
            throw e;
        }
        JSONArray subsArr = new JSONArray(new JSONTokener(reader));

        GeneralParser[] subObjects = new GeneralParser[subsArr.length()];
        for (int i = 0; i < subsArr.length(); i++) {
            JSONObject sub = subsArr.getJSONObject(i);

            String url = sub.getString("url");
            String urlType = sub.getString("urlType");
            String download = sub.getString("download");
            String[] urlParams = getUrlParams(sub.getJSONArray("urlParams"));

            subObjects[i] = createParserObject(url, urlType, download, urlParams);
        }

        return subObjects;
    }

    static private String[] getUrlParams(JSONArray jsonUrlParams) {
        String[] urlParams = new String[jsonUrlParams.length()];
        for (int j = 0; j < jsonUrlParams.length(); j++) {
            urlParams[j] = jsonUrlParams.getString(j);
        }

        return urlParams;
    }

    static private GeneralParser createParserObject(String url, String urlType, String download, String[] urlParams)
            throws Exception {
        GeneralParser res;
        if (urlType == "reddit") {
            res = new RedditParser(url, urlType, download, urlParams);
        } else {
            res = new RssParser(url, urlType, download, urlParams);
        }

        return res;
    }
}
