from rest_framework import routers
from pbf_file_size_estimation.views import SizeEstimationView

router = routers.SimpleRouter()

router.register(
    r"estimate_size_in_bytes", SizeEstimationView, basename="estimate_size_in_bytes"
)

urlpatterns = router.urls
