package parser;

import java.util.Arrays;

/*Esta clase modela los atributos y metodos comunes a todos los distintos tipos de parser existentes en la aplicacion*/
public abstract class GeneralParser {
    static private String[] validsUrlType = { "reddit", "rss" };

    private String url;
    private String urlType;
    private String download;
    private String[] urlParams;

    public GeneralParser(String url, String urlType, String download, String[] urlParams) throws Exception {
        if (!Arrays.asList(validsUrlType).contains(urlType)) {
            throw new Exception("El valor del campo 'urlType' es invalido. Campo dado por el usuario: " + urlType);
        }
        // ! Se tiene que validar el resto de campos

        this.url = url;
        this.urlType = urlType;
        this.download = download;
        this.urlParams = urlParams;
    }

    public void print() {
        System.out.println("================================");
        System.out.println("Url: " + this.url);
        System.out.println("urlType: " + this.urlType);
        System.out.println("download: " + this.download);

        System.out.println("Params:");
        for (String param : urlParams) {
            System.out.println("** " + param);
        }
        System.out.println("================================\n");
    }
}
