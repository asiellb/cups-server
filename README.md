# Cups Print Server Docker

The Docker image produced by this repo provides a docker container for CUPS configured to share an HP printer attached by USB.

# Init

- Using docker `docker run -d --privileged --restart=always -v /dev/bus/usb:/dev/bus/usb -v "/root/.cloudprint/":/root --name cupsgcp -p 631:631 asiellb/cups`
- Using `docker-compose`

## Configuration

 - Admin username and password `print:print`
 - Register printer with Google Cloud Print (GCP) `cloudprint -c`

## Additional steps

Browse to `https://<host_url>:631` and add the printer.

## Access from Linux

Add a printer with the following device URI:

	ipp://<host_url>:631/printers/<your_printer_name>

## Access from Windows

1. Got to `Control Panel -> Hardware and Sound -> Devices and Printers`
2. Right click and select `Add a printer`
3. Select `Add a network, wireless or Bluetooth printer`
4. Immediately select `The printer that I want isn't listed`
5. Choose `Select a shared printer by name` and specify `http://<host_url>:631/printers/<your_printer_name>`
7. Choose the appropriate driver.
8. (Optional) Print a test page.

## Inspired By

[dave-burke/docker-cups](https://github.com/dave-burke/docker-cups)  
[jaymoulin/docker-google-cloudprint](https://github.com/jaymoulin/docker-google-cloudprint)

