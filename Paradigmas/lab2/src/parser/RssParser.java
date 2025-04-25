package parser;

/* Esta clase implementa el parser de feed de tipo rss (xml)
 * https://www.tutorialspoint.com/java_xml/java_dom_parse_document.htm
 * */

public class RssParser extends GeneralParser {
    public RssParser(String url, String urlType, String download, String[] urlParams) throws Exception {
        super(url, urlType, download, urlParams);
    }
}
