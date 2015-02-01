Simple container that runs a [Reconcile-CSV](http://okfnlabs.org/reconcile-csv/) service to support fix matching/reconciliation against a reference CSV file.

Usage:

* `docker run --name reconmp -p 8001:8000 -d psychemedia/docker-reconciliation` runs the container against a reference data set of information about UK MPs
* `docker run --name recon2 -p 8001:8000 -v /path/to/mydir:/tmp/import -d psychemedia/docker-reconciliation sh -c 'java -jar reconcile-csv-0.1.1.jar /tmp/import/MYFILE.csv SEARCHCOL IDCOL'` will run the service against */path/to/mydir/MYFILE.csv* with identifiers in *IDCOL* and the fuzzy search targets in *SEARCHCOL*.

Then eg `boot2docker ip` to get the IP address of the service - eg *http://192.168.59.103* then the service endpoint is at *http://192.168.59.103:8001/reconcile*. Test with eg *http://192.168.59.103:8001/reconcile?query=David Cameroon*

TO DO:

I thought I should be able to link an OpenRefine container to the reconciliation service, eg using something like `docker run --name openrefiner -p 3335:3333 --link reconmp:reconmp -P -d psychemedia/openrefine`, but I can't seem to find a URL that works to register the service in OpenRefine. (In the above example, OpenRefine would be at *http://192.168.59.103:3335*. I can register the reconciliation service via *http://192.168.59.103:8001/reconcile* but not by something like *reconmp:8000/reconcile*, which I was hoping I would be able to do?)

The Dockerfile really should be a base file that doesn't reference a particular dataset? That way, we could build on it for Dockerfiles that generate images containing other reference datasets?