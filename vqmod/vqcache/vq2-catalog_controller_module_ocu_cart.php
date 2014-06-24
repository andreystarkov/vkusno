<?php

/**
 * OpenCart Ukrainian Community
 *
 * LICENSE
 *
 * This source file is subject to the GNU General Public License, Version 3
 * It is also available through the world-wide-web at this URL:
 * http://www.gnu.org/copyleft/gpl.html
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email

 *
 * @category   OpenCart
 * @package    OCU Cart
 * @copyright  Copyright (c) 2011 Eugene Lifescale by OpenCart Ukrainian Community (http://opencart-ukraine.tumblr.com)
 * @license    http://www.gnu.org/copyleft/gpl.html     GNU General Public License, Version 3
 */


class ControllerModuleOCUCart extends Controller {

    public function index()
    {
        // Load dependencies
        $this->language->load('module/ocu_cart');

        if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/ocu_cart.css')) {
            $this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/ocu_cart.css');
        } else {
            $this->document->addStyle('catalog/view/theme/default/stylesheet/ocu_cart.css');
        }

        // Calculate totals
        $total_data = array();
        $total = 0;
        $taxes = $this->cart->getTaxes();

        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
            $this->load->model('setting/extension');

            $sort_order = array();

            $results = $this->model_setting_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('total/' . $result['code']);

                    $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
                }
            }

            $sort_order = array();

            foreach ($total_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $total_data);
        }

        if ($this->cart->countProducts()) {
            
                
                    switch (isset($this->request->cookie['language']) && $this->request->cookie['language']) {
                        case 'ru':
                            $this->data['text_items'] =  'В корзине '.$this->plural_tool(
                                                         $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0),
                                                         $this->currency->format($total),
                                                         array('товар','товара','товаров'));
                        break;
                        case 'ua':
                            $this->data['text_items'] =  'У кошику '.$this->plural_tool(
                                                         $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0),
                                                         $this->currency->format($total),
                                                         array('товар','товару','товарів'));
                        break;
                        default:
                            $this->data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
                    }
                
            
        } else {
            $this->data['text_items'] = $this->language->get('text_cart_no_items');
        }

        $this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

        // Load template
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ocu_cart.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/ocu_cart.tpl';
        } else {
            $this->template = 'default/template/module/ocu_cart.tpl';
        }

        $this->response->setOutput($this->render());
    }
}
