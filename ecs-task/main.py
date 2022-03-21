import logging


if __name__ == "__main__":
	logging.basicConfig(level = logging.INFO)
	logger = logging.getLogger(__name__)
	logger.info('ECS task ran succesfully!')