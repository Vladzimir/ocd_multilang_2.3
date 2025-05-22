<?php

class ControllerExtensionModuleOcdMultilang extends Controller {

    public function index() {
        $this->load->model('extension/module/ocd_multilang');

        $languages = $this->model_extension_module_ocd_multilang->getLanguages();

        $result = [];

        $config_hreflang = $this->config->get('ocd_multilang_code');
        $language_id = $this->config->get('ocd_multilang_language');

        $url = '';

        if (!isset($this->request->get['route'])) {
            $href = $this->url->link('common/home');
        } else {
            $url_data = $this->request->get;

            unset($url_data['_route_']);

            $route = $url_data['route'];

            unset($url_data['route']);

            $url = '';

            if ($url_data) {
                $url = '&' . urldecode(http_build_query($url_data, '', '&'));
            }

            $protocol = $this->request->server['HTTPS'];

            if (isset($route) && isset($url) && isset($protocol)) {
                $href = $this->url->link($route, $url, $protocol);
            } else {
                $href = $this->url->link('common/home');
            }
        }

        $href = $this->getCanonical($href);

        $schema = parse_url($href, PHP_URL_SCHEME);
        $server = strtolower($schema) == 'https' ? HTTPS_SERVER : HTTP_SERVER;
        $query = substr($href, strlen($server) + 3);

        foreach ($languages as $language) {
            if (!isset($language['url'])) {
                $this->cache->delete('language');
                $this->cache->delete('seo_pro');

                $language['url'] = $this->model_extension_module_ocd_multilang->getLanguageUrl($language['language_id']);
            }

            if (isset($config_hreflang[$language['language_id']]) && $language['status']) {
                if ($language['language_id'] == $language_id) {
                    if ($language_id == $this->config->get('config_language_id')) {
                        $query = substr($href, strlen($server));
                    }

                    if (isset($this->request->get['route']) && $this->request->get['route'] == 'common/home') {
                        $link_href = $server . $language['url'] . '/' . ($query ? $query : '');
                    } else {
                        $link_href = $server . ($query ? $query : '');
                    }

                    $result[] = [
                        'name'      => $language['name'],
                        'code'      => $language['code'],
                        'url'       => $language['url'],
                        'prefix'    => $config_hreflang[$language['language_id']],
                        'href'      => $server . ($query ? $query : ''),
                        'href_lang' => $link_href,
                        'rel'       => 'alternate',
                    ];
                } else {
                    $result[] = [
                        'name'      => $language['name'],
                        'code'      => $language['code'],
                        'url'       => $language['url'],
                        'prefix'    => $config_hreflang[$language['language_id']],
                        'href'      => $server . $language['url'] . '/' . ($query ? $query : ''),
                        'href_lang' => $server . $language['url'] . '/' . ($query ? $query : ''),
                        'rel'       => 'alternate',
                    ];
                }
            }
        }

        return $result;
    }

    private function getCanonical($href) {
        $result = $href;

        foreach ($this->document->getLinks() as $link) {
            if ($link['rel'] == 'canonical') {
                $result = $link['href'];
            }
        }

        return $result;
    }
}