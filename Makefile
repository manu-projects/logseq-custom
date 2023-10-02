# Nota: no utilizamos los directorios como targets, porque dejamos elegir al usuario el nombre del directorio
create-logseq-workflow:
	@read -p "Ingrese la ruta del nuevo flujo de trabajo: " NEW_WORKFLOW_PATH; \
	mkdir --parents $${NEW_WORKFLOW_PATH}; \
	@read -p "Ingrese el nombre del nuevo flujo de trabajo: " NEW_WORKFLOW_NAME; \
	rsync \
				--verbose --recursive --human-readable --progress \
				logseq-template/ \
				$${NEW_WORKFLOW_PATH}/

# TODO: suponer que los templates podrían variar
update-templates-workflow:
	$(info Actualizando plantillas flujo de trabajo..)

.PHONY: create-logseq-workflow update-templates-workflow
