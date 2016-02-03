# osm-pbf-file-size-estimation-service
PBF File Size Extent Estimation

# Installation

Install via pip:
```bash
pip install geometalab.osm-pbf-file-size-estimation-service
```
or add to your requirements-file:
`geometalab.osm-pbf-file-size-estimation-service`

In your django project, add `pbf_file_size_estimation` to your `INSTALLED_APPS` settings and register the 
routers in your `urls.py`.

Example:

```python
# urls.py
# ...
router = DefaultRouter()
router.register(r'estimate_size_in_bytes', pbf_file_size_estimation.views.SizeEstimationView, base_name='estimate_size_in_bytes')
# ...
urlpatterns = [
    url(r'^', include(router.urls)),
]
```

Then the estimation service is reachable at `/estimate_size_in_bytes/` and reverse can be achieved using the basename.

## Build Statuses

`master` [![Build Status](https://travis-ci.org/geometalab/osm-pbf-file-size-estimation-service.svg?branch=master)](https://travis-ci.org/geometalab/osm-pbf-file-size-estimation-service)

`develop` [![Build Status](https://travis-ci.org/geometalab/osm-pbf-file-size-estimation-service.svg?branch=develop)](https://travis-ci.org/geometalab/osm-pbf-file-size-estimation-service)
